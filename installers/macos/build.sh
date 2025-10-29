#!/bin/bash

# Script để build DMG và ICNS cho Flutter app
# Sử dụng appdmg để tạo DMG và ImageMagick để tạo ICNS

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if required tools are installed
check_dependencies() {
    print_status "Kiểm tra dependencies..."
    
    # Check Node.js and npm
    if ! command -v node &> /dev/null; then
        print_error "Node.js chưa được cài đặt. Vui lòng cài đặt Node.js trước."
        exit 1
    fi
    
    if ! command -v npm &> /dev/null; then
        print_error "npm chưa được cài đặt. Vui lòng cài đặt npm trước."
        exit 1
    fi
    
    # Check jq for JSON parsing
    if ! command -v jq &> /dev/null; then
        print_warning "jq chưa được cài đặt. Sẽ cài đặt qua Homebrew..."
        if ! command -v brew &> /dev/null; then
            print_error "Homebrew chưa được cài đặt. Vui lòng cài đặt Homebrew và jq trước."
            exit 1
        fi
        brew install jq
    fi

    # Check ImageMagick for ICNS conversion
    if ! command -v convert &> /dev/null; then
        print_warning "ImageMagick chưa được cài đặt. Sẽ cài đặt qua Homebrew..."
        if ! command -v brew &> /dev/null; then
            print_error "Homebrew chưa được cài đặt. Vui lòng cài đặt Homebrew và ImageMagick trước."
            exit 1
        fi
        brew install imagemagick
    fi
    
    print_status "Tất cả dependencies đã sẵn sàng!"
}

# Install npm dependencies
install_dependencies() {
    print_status "Cài đặt npm dependencies..."
    if [ ! -f "package.json" ]; then
        print_error "package.json không tồn tại!"
        exit 1
    fi
    
    npm install
    print_status "Dependencies đã được cài đặt!"
}

# Load settings from build_setting.json
load_settings() {
    SETTINGS_FILE="build_setting.json"
    if [ ! -f "$SETTINGS_FILE" ]; then
        print_warning "Không tìm thấy build_setting.json, sử dụng giá trị mặc định."
        APP_NAME="flutter_base"
        TITLE="Test Title"
        ICON_SVG="logo.svg"
        ICON_ICNS="logo.icns"
        APP_PATH="build/macos/Build/Products/Release/${APP_NAME}.app"
        DMG_NAME="${APP_NAME}.dmg"
        SIGNING_IDENTITY=""
        BUNDLE_IDENTIFIER=""
        return
    fi

    # Read values with defaults
    APP_NAME=$(jq -r '.name // "flutter_base"' "$SETTINGS_FILE")
    TITLE=$(jq -r '.title // "Test Title"' "$SETTINGS_FILE")
    ICON_SVG=$(jq -r '.iconSvg // "logo.svg"' "$SETTINGS_FILE")
    ICON_ICNS=$(jq -r '.iconIcns // "logo.icns"' "$SETTINGS_FILE")
    APP_PATH=$(jq -r --arg def "build/macos/Build/Products/Release/${APP_NAME}.app" '.appPath // $def' "$SETTINGS_FILE")
    DMG_NAME=$(jq -r --arg def "${APP_NAME}.dmg" '.dmgName // $def' "$SETTINGS_FILE")
    SIGNING_IDENTITY=$(jq -r '.codeSign.signingIdentity // empty' "$SETTINGS_FILE")
    BUNDLE_IDENTIFIER=$(jq -r '.codeSign.identifier // empty' "$SETTINGS_FILE")
}

# Generate temporary appdmg config from base config.json and settings
generate_config() {
    if [ ! -f "config.json" ]; then
        print_error "File config.json không tồn tại!"
        exit 1
    fi

    OUTPUT_CONFIG=".generated.appdmg.json"

    # Build absolute paths to avoid ENOENT when appdmg runs in different contexts
    ABS_ICON_ICNS="$(pwd)/$ICON_ICNS"
    ABS_APP_PATH="$(cd "$(dirname "$APP_PATH")" 2>/dev/null && pwd)/$(basename "$APP_PATH")"

    # Start with basic filter
    JQ_FILTER='.title = $title | .icon = $icon | (.contents[] | select(.type=="file").path) |= $appPath'

    # Add code-sign handling if provided
    if [ -n "$SIGNING_IDENTITY" ] || [ -n "$BUNDLE_IDENTIFIER" ]; then
        JQ_FILTER+=' | .["code-sign"] = {}'
        
        if [ -n "$SIGNING_IDENTITY" ]; then
            JQ_FILTER+=' | .["code-sign"]["signing-identity"] = $signingIdentity'
        fi
        
        if [ -n "$BUNDLE_IDENTIFIER" ]; then
            JQ_FILTER+=' | .["code-sign"].identifier = $bundleId'
        fi
    fi

    jq \
        --arg title "$TITLE" \
        --arg icon "$ABS_ICON_ICNS" \
        --arg appPath "$ABS_APP_PATH" \
        --arg signingIdentity "$SIGNING_IDENTITY" \
        --arg bundleId "$BUNDLE_IDENTIFIER" \
        "$JQ_FILTER" config.json > "$OUTPUT_CONFIG"

    echo "$OUTPUT_CONFIG"
}

# Convert SVG to ICNS
create_icns() {
    print_status "Tạo file ICNS từ ${ICON_SVG}..."
    
    if [ ! -f "$ICON_SVG" ]; then
        print_error "File ${ICON_SVG} không tồn tại!"
        exit 1
    fi
    
    # Create iconset directory
    mkdir -p logo.iconset
    
    # Generate different sizes for ICNS
    sizes=(16 32 64 128 256 512 1024)
    
    for size in "${sizes[@]}"; do
        print_status "Tạo icon ${size}x${size}..."
        convert "$ICON_SVG" -resize ${size}x${size} logo.iconset/icon_${size}x${size}.png
        
        # Create @2x versions for retina displays
        retina_size=$((size * 2))
        print_status "Tạo icon ${retina_size}x${retina_size} (@2x)..."
        convert "$ICON_SVG" -resize ${retina_size}x${retina_size} logo.iconset/icon_${size}x${size}@2x.png
    done
    
    # Create ICNS file
    print_status "Tạo file ICNS..."
    iconutil -c icns logo.iconset -o "$ICON_ICNS"
    
    # Clean up iconset directory
    rm -rf logo.iconset
    
    print_status "File ${ICON_ICNS} đã được tạo thành công!"
}

# Build DMG using appdmg
build_dmg() {
    print_status "Build DMG file..."
    
    if [ ! -f "$ICON_ICNS" ]; then
        print_error "File ${ICON_ICNS} không tồn tại! Vui lòng chạy tạo ICNS trước."
        exit 1
    fi
    
    # Check if Flutter app exists
    app_path="$APP_PATH"
    if [ ! -d "$app_path" ]; then
        print_error "Flutter app không tồn tại tại $app_path"
        print_error "Vui lòng build Flutter app trước bằng lệnh: flutter build macos"
        exit 1
    fi
    
    # Remove existing DMG file if it exists
    if [ -f "$DMG_NAME" ]; then
        print_status "Xóa file DMG cũ: $DMG_NAME"
        rm -f "$DMG_NAME"
    fi
    
    # Generate config from settings
    GENERATED_CONFIG=$(generate_config)
    
    # Build DMG
    npx appdmg "$GENERATED_CONFIG" "$DMG_NAME"
    
    print_status "DMG file đã được tạo thành công: $DMG_NAME"
}

# Main function
main() {
    print_status "Bắt đầu build DMG và ICNS..."
    
    # Get script directory
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    cd "$SCRIPT_DIR"
    
    # Check dependencies
    check_dependencies
    
    # Load settings
    load_settings

    # Install npm dependencies
    install_dependencies
    
    # Create ICNS from SVG
    create_icns
    
    # Build DMG
    build_dmg
    
    print_status "Hoàn thành! File DMG: $DMG_NAME"
    print_status "File ICNS: $ICON_ICNS"
}

# Run main function
main "$@"
