import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lachule/bases/base_colors.dart';
import 'package:lachule/bases/base_sizes.dart';

class AppTextField extends StatefulWidget {
  const AppTextField(
    this.controller, {
    Key? key,
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
  }) : super(
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

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    bool? isObscure = widget.canObscure != null ? true : null;
    void onToggleObscure() {
      setState(() {
        isObscure = !isObscure!;
        print('in onToggleObscure $isObscure');
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller,
          obscureText: isObscure ?? false,
          keyboardType: widget.textInputType,
          maxLength: widget.maxLength,
          maxLengthEnforcement:
              widget.maxLength != null ? MaxLengthEnforcement.enforced : null,
          maxLines: widget.maxLine,
          minLines: widget.minLine,
          onChanged: (value) => widget.controller,
          readOnly: widget.readOnly,
          decoration: InputDecoration(
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
            counterText: '',
            prefixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (widget.prefixIcon != null) ...[
                  widget.prefixIcon!,
                ],
                const SizedBox(width: 8)
              ],
            ),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (widget.suffixIcon != null) ...[
                  const SizedBox(width: 16),
                  widget.suffixIcon!,
                ],
                if (widget.canObscure != null) ...[
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: onToggleObscure,
                    icon: isObscure! == true
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ],
                const SizedBox(width: 16)
              ],
            ),
          ),
          textInputAction: widget.textInputAction,
        ),
      ],
    );
  }
}
