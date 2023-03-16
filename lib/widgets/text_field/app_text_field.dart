import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';

class AppTextField extends StatefulWidget {
  AppTextField(this.controller,
      {Key? key,
      this.labelText,
      this.canObscure,
      this.suffixIcon,
      this.prefixIcon,
      this.textInputType,
      this.maxLength,
      this.maxLine = 1,
      this.minLine = 1,
      this.textInputAction,
      this.readOnly = false,
      this.enabled = true,
      this.isObscure = true,
      this.validator,
      this.autovalidateMode,
      this.inputFormatters,
      this.margin,
      this.padding,
      this.textStyle})
      : super(
          key: key,
        );
  final TextEditingController controller;
  final String? labelText;
  final bool? canObscure;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final int? maxLength;
  final int? maxLine;
  final int minLine;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final bool enabled;
  bool isObscure;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    void onToggleObscure() {
      setState(() {
        widget.isObscure = !widget.isObscure;
      });
    }

    return Container(
      margin: widget.margin ?? const EdgeInsets.only(top: 10),
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: widget.controller,
            obscureText: widget.canObscure != null ? widget.isObscure : false,
            keyboardType: widget.textInputType,
            maxLength: widget.maxLength,
            maxLengthEnforcement:
                widget.maxLength != null ? MaxLengthEnforcement.enforced : null,
            maxLines: widget.maxLine,
            minLines: widget.minLine,
            onChanged: (value) => widget.controller,
            readOnly: widget.readOnly,
            enabled: widget.enabled,
            style: widget.textStyle ??
                TextStyle(
                  color: widget.enabled
                      ? BaseColors.textPrimary
                      : BaseColors.tabTitle,
                  fontSize: BaseSizes.fontH4,
                ),
            inputFormatters: widget.inputFormatters,
            decoration: InputDecoration(
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: BaseColors.textContent),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: BaseColors.bgImageInputDisabled),
              ),
              label: Text(
                widget.labelText ?? '',
                style: const TextStyle(
                  color: BaseColors.btnDisabledPlaceholder,
                  fontSize: BaseSizes.fontH4,
                ),
              ),
              alignLabelWithHint: true,
              suffixIconConstraints: const BoxConstraints(minHeight: 16),
              prefixIconConstraints: const BoxConstraints(minHeight: 16),
              constraints: const BoxConstraints(minHeight: 50),
              counterText: '',
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (widget.prefixIcon != null) ...[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: widget.prefixIcon!,
                    ),
                  ],
                  const SizedBox(width: 8)
                ],
              ),
              suffixIcon: GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (widget.suffixIcon != null) ...[
                        const SizedBox(width: 16),
                        widget.suffixIcon!,
                      ],
                      if (widget.canObscure != null) ...[
                        const SizedBox(width: 16),
                        widget.isObscure == true
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      ],
                      const SizedBox(width: 16)
                    ],
                  ),
                ),
                onTap: () => onToggleObscure(),
              ),
            ),
            textInputAction: widget.textInputAction,
            validator: widget.validator,
            autovalidateMode: widget.autovalidateMode,
          ),
        ],
      ),
    );
  }
}
