import 'package:flutter/material.dart';
import '../constants/responsive_constants.dart';

/// Utility class cho responsive design
class ResponsiveUtils {
  /// Kiểm tra xem màn hình có phải mobile không
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <
        ResponsiveConstants.mobileBreakpoint;
  }

  /// Kiểm tra xem màn hình có phải tablet không
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= ResponsiveConstants.mobileBreakpoint &&
        width < ResponsiveConstants.tabletBreakpoint;
  }

  /// Kiểm tra xem màn hình có phải desktop không
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >=
        ResponsiveConstants.tabletBreakpoint;
  }

  /// Kiểm tra xem màn hình có phải large desktop không
  static bool isLargeDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >=
        ResponsiveConstants.largeDesktopBreakpoint;
  }

  /// Lấy padding responsive dựa trên kích thước màn hình
  static double getResponsivePadding(BuildContext context) {
    if (isMobile(context)) return ResponsiveConstants.mobilePadding;
    if (isTablet(context)) return ResponsiveConstants.tabletPadding;
    return ResponsiveConstants.desktopPadding;
  }

  /// Lấy font size responsive dựa trên kích thước màn hình
  static double getResponsiveFontSize(BuildContext context) {
    if (isMobile(context)) return ResponsiveConstants.mobileFontSize;
    if (isTablet(context)) return ResponsiveConstants.tabletFontSize;
    return ResponsiveConstants.desktopFontSize;
  }

  /// Lấy icon size responsive dựa trên kích thước màn hình
  static double getResponsiveIconSize(BuildContext context) {
    if (isMobile(context)) return ResponsiveConstants.mobileIconSize;
    if (isTablet(context)) return ResponsiveConstants.tabletIconSize;
    return ResponsiveConstants.desktopIconSize;
  }

  /// Lấy button height responsive dựa trên kích thước màn hình
  static double getResponsiveButtonHeight(BuildContext context) {
    if (isMobile(context)) return ResponsiveConstants.mobileButtonHeight;
    if (isTablet(context)) return ResponsiveConstants.tabletButtonHeight;
    return ResponsiveConstants.desktopButtonHeight;
  }

  /// Lấy border radius responsive dựa trên kích thước màn hình
  static double getResponsiveBorderRadius(BuildContext context) {
    if (isMobile(context)) return ResponsiveConstants.mobileBorderRadius;
    if (isTablet(context)) return ResponsiveConstants.tabletBorderRadius;
    return ResponsiveConstants.desktopBorderRadius;
  }

  /// Lấy spacing responsive dựa trên kích thước màn hình
  static double getResponsiveSpacing(BuildContext context) {
    if (isMobile(context)) return ResponsiveConstants.mobileSpacing;
    if (isTablet(context)) return ResponsiveConstants.tabletSpacing;
    return ResponsiveConstants.desktopSpacing;
  }

  /// Lấy số cột grid responsive dựa trên kích thước màn hình
  static int getResponsiveGridColumns(BuildContext context) {
    if (isMobile(context)) return ResponsiveConstants.mobileGridColumns;
    if (isTablet(context)) return ResponsiveConstants.tabletGridColumns;
    if (isLargeDesktop(context)) {
      return ResponsiveConstants.largeDesktopGridColumns;
    }
    return ResponsiveConstants.desktopGridColumns;
  }

  /// Lấy max content width dựa trên kích thước màn hình
  static double getMaxContentWidth(BuildContext context) {
    if (isLargeDesktop(context)) {
      return ResponsiveConstants.maxContentWidthLarge;
    }
    return ResponsiveConstants.maxContentWidth;
  }

  /// Lấy responsive value dựa trên breakpoint
  static T getResponsiveValue<T>(
    BuildContext context, {
    required T mobile,
    required T tablet,
    required T desktop,
    T? largeDesktop,
  }) {
    if (isMobile(context)) return mobile;
    if (isTablet(context)) return tablet;
    if (isLargeDesktop(context) && largeDesktop != null) return largeDesktop;
    return desktop;
  }

  /// Lấy responsive width dựa trên tỷ lệ phần trăm
  static double getResponsiveWidth(BuildContext context, double percentage) {
    final screenWidth = MediaQuery.of(context).size.width;
    final maxWidth = getMaxContentWidth(context);
    final actualWidth = screenWidth > maxWidth ? maxWidth : screenWidth;
    return actualWidth * (percentage / 100);
  }

  /// Lấy responsive height dựa trên tỷ lệ phần trăm
  static double getResponsiveHeight(BuildContext context, double percentage) {
    final screenHeight = MediaQuery.of(context).size.height;
    return screenHeight * (percentage / 100);
  }

  /// Kiểm tra orientation
  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  /// Lấy safe area padding
  static EdgeInsets getSafeAreaPadding(BuildContext context) {
    return MediaQuery.of(context).padding;
  }

  /// Lấy viewport size
  static Size getViewportSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  /// Lấy device pixel ratio
  static double getDevicePixelRatio(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio;
  }

  /// Kiểm tra xem có phải dark mode không
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
