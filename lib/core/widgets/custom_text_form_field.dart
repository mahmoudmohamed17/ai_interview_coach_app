import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.onFieldSubmitted,
    this.onChanged,
    this.hintText,
    this.label,
    this.initialValue,
    this.hintStyle,
    this.textStyle,
    this.fillColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.prefixIcon,
    this.padding = 16.0,
    this.borderRadius = 24.0,
    this.borderWidth = 1.0,
    this.maxLines,
  });

  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final String? hintText;
  final String? label;
  final String? initialValue;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Color fillColor;
  final Color borderColor;
  final Icon? prefixIcon;
  final double padding;
  final double borderRadius;
  final double borderWidth;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return '$label is required';
        } else {
          return null;
        }
      },
      controller: controller,
      style: textStyle,
      initialValue: initialValue,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        fillColor: fillColor,
        contentPadding: EdgeInsets.all(padding),
        filled: true,
        prefixIcon: prefixIcon,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: BorderSide(color: borderColor, width: borderWidth),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor, width: borderWidth),
        ),
      ),
    );
  }
}
