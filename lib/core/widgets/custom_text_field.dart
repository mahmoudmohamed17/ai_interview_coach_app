import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.hintStyle,
    this.textStyle,
    this.fillColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.prefixIcon,
    this.padding = 16.0,
    this.borderRadius = 24.0,
    this.borderWidth = 1.0,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Color fillColor;
  final Color borderColor;
  final Icon? prefixIcon;
  final double padding;
  final double borderRadius;
  final double borderWidth;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: textStyle,
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
