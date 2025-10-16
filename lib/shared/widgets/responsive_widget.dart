import 'package:flutter/material.dart';
import '../../core/utils/responsive_utils.dart';

/// Base widget cho responsive design
class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;
  final Widget? largeDesktop;

  const ResponsiveWidget({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
    this.largeDesktop,
  });

  @override
  Widget build(BuildContext context) {
    if (ResponsiveUtils.isMobile(context)) {
      return mobile;
    } else if (ResponsiveUtils.isTablet(context)) {
      return tablet ?? mobile;
    } else if (ResponsiveUtils.isLargeDesktop(context) &&
        largeDesktop != null) {
      return largeDesktop!;
    } else {
      return desktop ?? tablet ?? mobile;
    }
  }
}

/// Responsive builder widget
class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, bool isMobile, bool isTablet,
      bool isDesktop, bool isLargeDesktop) builder;

  const ResponsiveBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final isTablet = ResponsiveUtils.isTablet(context);
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final isLargeDesktop = ResponsiveUtils.isLargeDesktop(context);

    return builder(context, isMobile, isTablet, isDesktop, isLargeDesktop);
  }
}

/// Responsive container với padding và constraints
class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final double? maxWidth;
  final Alignment? alignment;
  final Color? color;
  final Decoration? decoration;
  final EdgeInsets? margin;

  const ResponsiveContainer({
    super.key,
    required this.child,
    this.padding,
    this.maxWidth,
    this.alignment,
    this.color,
    this.decoration,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final responsivePadding = padding ??
        EdgeInsets.all(ResponsiveUtils.getResponsivePadding(context));
    final responsiveMaxWidth =
        maxWidth ?? ResponsiveUtils.getMaxContentWidth(context);

    return Container(
      padding: responsivePadding,
      margin: margin,
      color: color,
      decoration: decoration,
      alignment: alignment,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: responsiveMaxWidth,
        ),
        child: child,
      ),
    );
  }
}

/// Responsive text widget
class ResponsiveText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  const ResponsiveText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontSize,
    this.fontWeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final responsiveFontSize =
        fontSize ?? ResponsiveUtils.getResponsiveFontSize(context);

    return Text(
      text,
      style: style?.copyWith(
            fontSize: responsiveFontSize,
            fontWeight: fontWeight,
            color: color,
          ) ??
          TextStyle(
            fontSize: responsiveFontSize,
            fontWeight: fontWeight,
            color: color,
          ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

/// Responsive button widget
class ResponsiveButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final double? height;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? borderRadius;

  const ResponsiveButton({
    super.key,
    required this.child,
    this.onPressed,
    this.style,
    this.height,
    this.padding,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final responsiveHeight =
        height ?? ResponsiveUtils.getResponsiveButtonHeight(context);
    final responsivePadding = padding ??
        EdgeInsets.symmetric(
          horizontal: ResponsiveUtils.getResponsivePadding(context),
          vertical: ResponsiveUtils.getResponsiveSpacing(context),
        );
    final responsiveBorderRadius =
        borderRadius ?? ResponsiveUtils.getResponsiveBorderRadius(context);

    return SizedBox(
      height: responsiveHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style ??
            ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              padding: responsivePadding,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(responsiveBorderRadius),
              ),
            ),
        child: child,
      ),
    );
  }
}

/// Responsive icon widget
class ResponsiveIcon extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final double? size;
  final String? semanticLabel;

  const ResponsiveIcon(
    this.icon, {
    super.key,
    this.color,
    this.size,
    this.semanticLabel,
  });

  @override
  Widget build(BuildContext context) {
    final responsiveSize =
        size ?? ResponsiveUtils.getResponsiveIconSize(context);

    return Icon(
      icon,
      size: responsiveSize,
      color: color,
      semanticLabel: semanticLabel,
    );
  }
}

/// Responsive spacing widget
class ResponsiveSpacing extends StatelessWidget {
  final double? height;
  final double? width;
  final double? multiplier;

  const ResponsiveSpacing({
    super.key,
    this.height,
    this.width,
    this.multiplier = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final responsiveSpacing =
        ResponsiveUtils.getResponsiveSpacing(context) * multiplier!;

    return SizedBox(
      height: height ?? responsiveSpacing,
      width: width ?? responsiveSpacing,
    );
  }
}
