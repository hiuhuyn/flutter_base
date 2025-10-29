# Flutter Base DMG Builder

Tool để build file DMG cho Flutter app trên macOS sử dụng appdmg và tạo file ICNS từ SVG.
Toàn bộ đường dẫn/tên app/tên DMG/icon được lấy từ `build_setting.json`. File `config.json` chỉ đóng vai trò mẫu cơ sở để định nghĩa layout (vị trí icon, kích thước, màu nền), đường dẫn trong `config.json` sẽ bị override khi build.

## Tính năng

- ✅ Tự động tạo file ICNS từ logo.svg
- ✅ Build DMG sử dụng npm appdmg
- ✅ Kiểm tra dependencies tự động
- ✅ Hỗ trợ code signing
- ✅ Giao diện console đẹp với màu sắc

## Yêu cầu hệ thống

- macOS (để tạo DMG và ICNS)
- Node.js >= 14.0.0
- npm
- ImageMagick (để convert SVG sang ICNS)
- Homebrew (để cài đặt ImageMagick nếu chưa có)

## Cài đặt

1. **Cài đặt dependencies hệ thống:**
   ```bash
   # Cài đặt ImageMagick qua Homebrew
   brew install imagemagick
   ```

2. **Cài đặt npm dependencies:**
   ```bash
   cd installers/macos
   npm install
   ```

## Sử dụng

### Cách 1: Sử dụng script build.sh (Khuyến nghị)

```bash
cd installers/macos
./build.sh
```

Script này sẽ:
1. Kiểm tra tất cả dependencies
2. Cài đặt npm packages
3. Tạo file `logo.icns` từ `logo.svg`
4. Sinh file `.generated.appdmg.json` từ `config.json` và `build_setting.json` (override mọi đường dẫn)
5. Build file DMG theo cấu hình trong `build_setting.json`

### Cách 2: Sử dụng npm scripts

```bash
cd installers/macos

# Build DMG (cần có logo.icns trước)
npm run build-dmg

# Hoặc sử dụng script đầy đủ
npm run build
```

## Cấu trúc file

```
installers/macos/
├── build.sh              # Script chính để build DMG và ICNS
├── package.json          # npm dependencies
├── config.json           # Mẫu layout cho appdmg (không cần cấu hình đường dẫn)
├── build_setting.json    # Cấu hình đầu vào cho tool (tên app, đường dẫn, ...)
├── logo.svg              # Logo gốc (SVG)
├── logo.icns             # Logo đã convert (tự động tạo)
└── flutter_base.dmg      # File DMG cuối cùng (tự động tạo)
```

## Cấu hình build_setting.json (bắt buộc)

Bạn chỉ cần cấu hình 1 lần tại `build_setting.json`. Các trường hỗ trợ:

```json
{
  "name": "flutter_base",                       // Tên app (không có .app)
  "title": "Test Title",                        // Tiêu đề cửa sổ DMG
  "appPath": "build/macos/Build/Products/Release/flutter_base.app", // Đường dẫn .app
  "dmgName": "flutter_base.dmg",               // Tên file DMG đầu ra
  "iconSvg": "logo.svg",                        // Nguồn icon SVG
  "iconIcns": "logo.icns",                      // Tên file ICNS sinh ra
  "codeSign": {                                   // Tùy chọn: cấu hình ký mã
    "signingIdentity": "Developer ID Application: Trung Le (YW3YX5785H)",
    "identifier": "com.example.flutterBaseSmall"
  }
}
```

Các trường có thể bỏ trống; script sẽ tự dùng giá trị mặc định hợp lý.

## Cấu hình config.json (tùy chọn – chỉ layout)

File `config.json` là mẫu cơ sở cho appdmg để định nghĩa layout Finder (màu nền, kích thước icon, vị trí các item...). Khi chạy, script sẽ tự sinh file `.generated.appdmg.json` dựa trên `build_setting.json` và override các trường sau:

- `title` (từ `build_setting.json.title`)
- `icon` (đường dẫn tuyệt đối tới `iconIcns`)
- `contents[].path` của các item có `type == "file"` (đường dẫn tuyệt đối tới `.app`)
- `code-sign` (nếu `codeSign` có trong `build_setting.json`)

Vì vậy, bạn không cần (và không nên) cấu hình đường dẫn trong `config.json`. Hãy chỉ tinh chỉnh layout tại đây nếu muốn (ví dụ thay đổi vị trí `x,y` của icon, `icon-size`, `background-color`).

```json
{
  "title": "Test Title",                    // Tiêu đề DMG
  "icon": "logo.icns",                     // Icon DMG
  "background-color": "#FFFFFF",           // Màu nền
  "icon-size": 80,                         // Kích thước icon
  "code-sign": {                           // Code signing (tùy chọn)
    "signing-identity": "Developer ID Application: Trung Le (YW3YX5785H)",
    "identifier": "com.example.flutterBaseSmall"
  },
  "contents": [                            // Nội dung DMG
    {
      "x": 448,
      "y": 344,
      "type": "link",
      "path": "/Applications"
    },
    {
      "x": 192,
      "y": 344,
      "type": "file",
      "path": "build/macos/Build/Products/Release/flutter_base.app"
    }
  ]
}
```

## Troubleshooting

### Lỗi "Flutter app không tồn tại"
```bash
# Build Flutter app trước
flutter build macos
```

### Lỗi "ImageMagick chưa được cài đặt"
```bash
# Cài đặt ImageMagick
brew install imagemagick
```

### Lỗi "Node.js chưa được cài đặt"
```bash
# Cài đặt Node.js qua Homebrew
brew install node
```

## Tùy chỉnh

### Thay đổi logo
1. Thay thế file `logo.svg` bằng logo mới
2. Chạy lại `./build.sh`

### Thay đổi cấu hình DMG
1. Chỉnh sửa file `build_setting.json` cho tên app/đường dẫn/tên DMG/icon
2. (Tùy chọn) Chỉnh sửa file `config.json` nếu muốn thay đổi layout Finder
3. Chạy lại `./build.sh`

### Thay đổi đường dẫn Flutter app
Cập nhật `path` trong `config.json`:
```json
{
  "x": 192,
  "y": 344,
  "type": "file",
  "path": "build/macos/Build/Products/Release/flutter_base.app"
}
```

## Output

Sau khi build thành công, bạn sẽ có:
- `logo.icns`: File icon cho macOS
- `flutter_base.dmg`: File DMG để phân phối app
