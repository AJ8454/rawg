import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.focusNode,
    required this.labelText,
    required this.hintText,
    this.errorText,
    this.prefixWidget,
    this.suffixWidget,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.maxLines = 1,
    this.keyboardType,
    this.isEnabled = true,
    this.obscureText = false,
  });
  final TextEditingController? controller;
  final String labelText;
  final String hintText;
  final String? errorText;
  final FocusNode? focusNode;
  final int? maxLines;
  final bool obscureText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      obscureText: obscureText,
      onFieldSubmitted: onFieldSubmitted,
      enabled: isEnabled,
      validator: validator,
      keyboardType: keyboardType,
      textAlignVertical: TextAlignVertical.center,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefix: prefixWidget,
        suffixIcon: suffixWidget,
        errorText: errorText,
      ),
    );
  }
}
