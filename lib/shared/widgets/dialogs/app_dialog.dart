import 'package:flutter/material.dart';
import '../../../core/config/app_theme.dart';

class AppDialog {
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    String? content,
    Widget? child,
    List<AppDialogAction>? actions,
    bool barrierDismissible = true,
    Color? backgroundColor,
    BorderRadius? borderRadius,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AppAlertDialog(
        title: title,
        content: content,
        actions: actions,
        backgroundColor: backgroundColor,
        borderRadius: borderRadius,
        child: child,
      ),
    );
  }

  static Future<T?> showConfirm<T>({
    required BuildContext context,
    required String title,
    required String content,
    required VoidCallback onConfirm,
    String confirmText = 'Xác nhận',
    String cancelText = 'Hủy',
    Color? confirmColor,
    bool barrierDismissible = true,
  }) {
    return show<T>(
      context: context,
      title: title,
      content: content,
      barrierDismissible: barrierDismissible,
      actions: [
        AppDialogAction(
          text: cancelText,
          onPressed: () => Navigator.of(context).pop(),
          type: AppDialogActionType.secondary,
        ),
        AppDialogAction(
          text: confirmText,
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm();
          },
          type: AppDialogActionType.primary,
          color: confirmColor,
        ),
      ],
    );
  }

  static Future<T?> showBottomSheet<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    bool isDismissible = true,
    bool isScrollControlled = true,
    Color? backgroundColor,
    BorderRadius? borderRadius,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius:
            borderRadius ??
            const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => AppBottomSheet(title: title, child: child),
    );
  }

  static Future<T?> showActionSheet<T>({
    required BuildContext context,
    required List<AppActionSheetItem> items,
    String? title,
    String? cancelText = 'Hủy',
  }) {
    return showBottomSheet<T>(
      context: context,
      title: title,
      child: AppActionSheet(items: items, cancelText: cancelText),
    );
  }
}

class AppAlertDialog extends StatelessWidget {
  final String title;
  final String? content;
  final Widget? child;
  final List<AppDialogAction>? actions;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  const AppAlertDialog({
    super.key,
    required this.title,
    this.content,
    this.child,
    this.actions,
    this.backgroundColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final designVars = context.designVariables;

    return AlertDialog(
      backgroundColor: backgroundColor ?? designVars.background,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: designVars.title,
        ),
      ),
      content:
          child ??
          (content != null
              ? Text(
                  content!,
                  style: TextStyle(color: designVars.textMessage, fontSize: 14),
                )
              : null),
      actions: actions
          ?.map((action) => _buildActionButton(context, action))
          .toList(),
    );
  }

  Widget _buildActionButton(BuildContext context, AppDialogAction action) {
    final designVars = context.designVariables;

    switch (action.type) {
      case AppDialogActionType.primary:
        return ElevatedButton(
          onPressed: action.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor:
                action.color ?? designVars.btnBgAttHighIntInfoNormal,
            foregroundColor: designVars.btnLabelAttHigh,
          ),
          child: Text(action.text),
        );
      case AppDialogActionType.secondary:
        return OutlinedButton(
          onPressed: action.onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: designVars.btnLabelAttMediumIntInfo,
            side: BorderSide(color: designVars.btnLabelAttMediumIntInfo),
          ),
          child: Text(action.text),
        );
      case AppDialogActionType.text:
        return TextButton(
          onPressed: action.onPressed,
          style: TextButton.styleFrom(foregroundColor: designVars.link),
          child: Text(action.text),
        );
    }
  }
}

class AppBottomSheet extends StatelessWidget {
  final String? title;
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const AppBottomSheet({
    super.key,
    this.title,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final designVars = context.designVariables;

    return Container(
      padding: padding ?? const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: designVars.background,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Text(
              title!,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: designVars.title,
              ),
            ),
            const SizedBox(height: 16),
          ],
          Flexible(child: child),
        ],
      ),
    );
  }
}

class AppActionSheet extends StatelessWidget {
  final List<AppActionSheetItem> items;
  final String? cancelText;

  const AppActionSheet({super.key, required this.items, this.cancelText});

  @override
  Widget build(BuildContext context) {
    final designVars = context.designVariables;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...items.map(
          (item) => ListTile(
            leading: item.icon != null
                ? Icon(
                    item.icon,
                    color: item.isDestructive
                        ? designVars.btnLabelAttLowIntDanger
                        : designVars.listMenuItemIcon,
                  )
                : null,
            title: Text(
              item.title,
              style: TextStyle(
                color: item.isDestructive
                    ? designVars.btnLabelAttLowIntDanger
                    : designVars.listMenuItemText,
              ),
            ),
            subtitle: item.subtitle != null
                ? Text(
                    item.subtitle!,
                    style: TextStyle(
                      color: designVars.textMessageMuted,
                      fontSize: 12,
                    ),
                  )
                : null,
            onTap: () {
              Navigator.of(context).pop();
              item.onTap?.call();
            },
            tileColor: designVars.listMenuItemBg,
          ),
        ),
        if (cancelText != null) ...[
          Divider(color: designVars.borderBar),
          ListTile(
            title: Text(
              cancelText!,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: designVars.listMenuItemText,
              ),
            ),
            onTap: () => Navigator.of(context).pop(),
            tileColor: designVars.listMenuItemBg,
          ),
        ],
      ],
    );
  }
}

class AppDialogAction {
  final String text;
  final VoidCallback? onPressed;
  final AppDialogActionType type;
  final Color? color;

  const AppDialogAction({
    required this.text,
    this.onPressed,
    this.type = AppDialogActionType.primary,
    this.color,
  });
}

class AppActionSheetItem {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool isDestructive;

  const AppActionSheetItem({
    required this.title,
    this.subtitle,
    this.icon,
    this.onTap,
    this.isDestructive = false,
  });
}

enum AppDialogActionType { primary, secondary, text }
