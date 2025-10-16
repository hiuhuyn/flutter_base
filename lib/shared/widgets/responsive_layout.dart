import 'package:flutter/material.dart';
import '../../core/utils/responsive_utils.dart';

/// Responsive grid layout
class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final double? spacing;
  final double? runSpacing;
  final int? crossAxisCount;
  final double? childAspectRatio;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

  const ResponsiveGrid({
    super.key,
    required this.children,
    this.spacing,
    this.runSpacing,
    this.crossAxisCount,
    this.childAspectRatio,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    final responsiveSpacing =
        spacing ?? ResponsiveUtils.getResponsiveSpacing(context);
    final responsiveRunSpacing =
        runSpacing ?? ResponsiveUtils.getResponsiveSpacing(context);
    final responsiveCrossAxisCount =
        crossAxisCount ?? ResponsiveUtils.getResponsiveGridColumns(context);

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: responsiveCrossAxisCount,
        crossAxisSpacing: responsiveSpacing,
        mainAxisSpacing: responsiveRunSpacing,
        childAspectRatio: childAspectRatio ?? 1.0,
      ),
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
    );
  }
}

/// Responsive list layout
class ResponsiveList extends StatelessWidget {
  final List<Widget> children;
  final Axis scrollDirection;
  final EdgeInsets? padding;
  final double? spacing;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

  const ResponsiveList({
    super.key,
    required this.children,
    this.scrollDirection = Axis.vertical,
    this.padding,
    this.spacing,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    final responsivePadding = padding ??
        EdgeInsets.all(ResponsiveUtils.getResponsivePadding(context));
    final responsiveSpacing =
        spacing ?? ResponsiveUtils.getResponsiveSpacing(context);

    return ListView.separated(
      scrollDirection: scrollDirection,
      padding: responsivePadding,
      itemCount: children.length,
      separatorBuilder: (context, index) => SizedBox(
        width: scrollDirection == Axis.horizontal ? responsiveSpacing : 0,
        height: scrollDirection == Axis.vertical ? responsiveSpacing : 0,
      ),
      itemBuilder: (context, index) => children[index],
    );
  }
}

/// Responsive row layout
class ResponsiveRow extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final double? spacing;
  final bool wrap;

  const ResponsiveRow({
    super.key,
    required this.children,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.mainAxisSize,
    this.spacing,
    this.wrap = false,
  });

  @override
  Widget build(BuildContext context) {
    final responsiveSpacing =
        spacing ?? ResponsiveUtils.getResponsiveSpacing(context);

    if (wrap) {
      return Wrap(
        spacing: responsiveSpacing,
        runSpacing: responsiveSpacing,
        alignment: _getWrapAlignment(mainAxisAlignment),
        crossAxisAlignment: _getWrapCrossAlignment(crossAxisAlignment),
        children: children,
      );
    }

    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      mainAxisSize: mainAxisSize ?? MainAxisSize.max,
      children: _buildChildrenWithSpacing(children, responsiveSpacing),
    );
  }

  List<Widget> _buildChildrenWithSpacing(
      List<Widget> children, double spacing) {
    if (children.isEmpty) return children;

    final List<Widget> result = [];
    for (int i = 0; i < children.length; i++) {
      result.add(children[i]);
      if (i < children.length - 1) {
        result.add(SizedBox(width: spacing));
      }
    }
    return result;
  }

  WrapAlignment _getWrapAlignment(MainAxisAlignment? alignment) {
    switch (alignment) {
      case MainAxisAlignment.start:
        return WrapAlignment.start;
      case MainAxisAlignment.end:
        return WrapAlignment.end;
      case MainAxisAlignment.center:
        return WrapAlignment.center;
      case MainAxisAlignment.spaceBetween:
        return WrapAlignment.spaceBetween;
      case MainAxisAlignment.spaceAround:
        return WrapAlignment.spaceAround;
      case MainAxisAlignment.spaceEvenly:
        return WrapAlignment.spaceEvenly;
      default:
        return WrapAlignment.start;
    }
  }

  WrapCrossAlignment _getWrapCrossAlignment(CrossAxisAlignment? alignment) {
    switch (alignment) {
      case CrossAxisAlignment.start:
        return WrapCrossAlignment.start;
      case CrossAxisAlignment.end:
        return WrapCrossAlignment.end;
      case CrossAxisAlignment.center:
        return WrapCrossAlignment.center;
      default:
        return WrapCrossAlignment.center;
    }
  }
}

/// Responsive column layout
class ResponsiveColumn extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final double? spacing;

  const ResponsiveColumn({
    super.key,
    required this.children,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.mainAxisSize,
    this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    final responsiveSpacing =
        spacing ?? ResponsiveUtils.getResponsiveSpacing(context);

    return Column(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      mainAxisSize: mainAxisSize ?? MainAxisSize.max,
      children: _buildChildrenWithSpacing(children, responsiveSpacing),
    );
  }

  List<Widget> _buildChildrenWithSpacing(
      List<Widget> children, double spacing) {
    if (children.isEmpty) return children;

    final List<Widget> result = [];
    for (int i = 0; i < children.length; i++) {
      result.add(children[i]);
      if (i < children.length - 1) {
        result.add(SizedBox(height: spacing));
      }
    }
    return result;
  }
}

/// Responsive flex layout
class ResponsiveFlex extends StatelessWidget {
  final List<Widget> children;
  final Axis direction;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final double? spacing;
  final List<int>? flexValues;

  const ResponsiveFlex({
    super.key,
    required this.children,
    this.direction = Axis.horizontal,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.mainAxisSize,
    this.spacing,
    this.flexValues,
  });

  @override
  Widget build(BuildContext context) {
    final responsiveSpacing =
        spacing ?? ResponsiveUtils.getResponsiveSpacing(context);

    return Flex(
      direction: direction,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      mainAxisSize: mainAxisSize ?? MainAxisSize.max,
      children: _buildChildrenWithFlex(children, flexValues, responsiveSpacing),
    );
  }

  List<Widget> _buildChildrenWithFlex(
      List<Widget> children, List<int>? flexValues, double spacing) {
    if (children.isEmpty) return children;

    final List<Widget> result = [];
    for (int i = 0; i < children.length; i++) {
      final flex =
          flexValues != null && i < flexValues.length ? flexValues[i] : 1;
      result.add(Expanded(flex: flex, child: children[i]));

      if (i < children.length - 1) {
        result.add(SizedBox(
          width: direction == Axis.horizontal ? spacing : 0,
          height: direction == Axis.vertical ? spacing : 0,
        ));
      }
    }
    return result;
  }
}

/// Responsive card layout
class ResponsiveCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? color;
  final double? elevation;
  final double? borderRadius;
  final BoxShadow? shadow;

  const ResponsiveCard({
    super.key,
    required this.child,
    this.margin,
    this.padding,
    this.color,
    this.elevation,
    this.borderRadius,
    this.shadow,
  });

  @override
  Widget build(BuildContext context) {
    final responsivePadding = padding ??
        EdgeInsets.all(ResponsiveUtils.getResponsivePadding(context));
    final responsiveMargin =
        margin ?? EdgeInsets.all(ResponsiveUtils.getResponsiveSpacing(context));
    final responsiveBorderRadius =
        borderRadius ?? ResponsiveUtils.getResponsiveBorderRadius(context);
    final responsiveElevation = elevation ?? 2.0;

    return Card(
      margin: responsiveMargin,
      elevation: responsiveElevation,
      color: color,
      shadowColor: shadow?.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(responsiveBorderRadius),
      ),
      child: Padding(
        padding: responsivePadding,
        child: child,
      ),
    );
  }
}
