import 'package:flutter/material.dart';
import '../../../core/config/app_theme.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? helperText;
  final String? errorText;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onTap;
  final bool readOnly;
  final bool enabled;
  final int? maxLines;
  final int? maxLength;
  final FocusNode? focusNode;
  final AppTextFieldType type;

  const AppTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.readOnly = false,
    this.enabled = true,
    this.maxLines = 1,
    this.maxLength,
    this.focusNode,
    this.type = AppTextFieldType.outlined,
  });

  @override
  Widget build(BuildContext context) {
    final designVars = context.designVariables;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: TextStyle(
              color: designVars.textMessage,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
        ],
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          validator: validator,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          onTap: onTap,
          readOnly: readOnly,
          enabled: enabled,
          maxLines: maxLines,
          maxLength: maxLength,
          focusNode: focusNode,
          decoration: _buildDecoration(context),
        ),
        if (helperText != null) ...[
          const SizedBox(height: 4),
          Text(
            helperText!,
            style: TextStyle(color: designVars.textMessageMuted, fontSize: 12),
          ),
        ],
        if (errorText != null) ...[
          const SizedBox(height: 4),
          Text(
            errorText!,
            style: TextStyle(
              color: designVars.btnLabelAttLowIntDanger,
              fontSize: 12,
            ),
          ),
        ],
      ],
    );
  }

  InputDecoration _buildDecoration(BuildContext context) {
    final designVars = context.designVariables;
    final decoration = InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: designVars.textMessageMuted),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      counterText: maxLength != null ? null : '',
    );

    switch (type) {
      case AppTextFieldType.outlined:
        return decoration.copyWith(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: designVars.borderBar),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: designVars.borderBar),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: designVars.btnLabelAttMediumIntInfo),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: designVars.btnLabelAttLowIntDanger),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: designVars.btnLabelAttLowIntDanger),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        );

      case AppTextFieldType.filled:
        return decoration.copyWith(
          filled: true,
          fillColor: designVars.bgSearchInput,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: designVars.btnLabelAttMediumIntInfo),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: designVars.btnLabelAttLowIntDanger),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: designVars.btnLabelAttLowIntDanger),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        );

      case AppTextFieldType.underlined:
        return decoration.copyWith(
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: designVars.borderBar),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: designVars.borderBar),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: designVars.btnLabelAttMediumIntInfo),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: designVars.btnLabelAttLowIntDanger),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: designVars.btnLabelAttLowIntDanger),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 12,
          ),
        );
    }
  }
}

enum AppTextFieldType { outlined, filled, underlined }
