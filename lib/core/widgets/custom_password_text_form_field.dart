import 'package:flutter/material.dart';

class CustomPasswordTextFormField extends StatefulWidget {
  const CustomPasswordTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.label,
    this.hintStyle,
    this.textStyle,
    this.fillColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.iconColor,
    this.padding = 16.0,
    this.borderRadius = 24.0,
    this.borderWidth = 1.0,
  });

  final TextEditingController controller;
  final String hintText;
  final String? label;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Color fillColor;
  final Color borderColor;
  final Color? iconColor;
  final double padding;
  final double borderRadius;
  final double borderWidth;

  @override
  State<CustomPasswordTextFormField> createState() =>
      _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState
    extends State<CustomPasswordTextFormField> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return '${widget.label} is required';
        } else {
          return null;
        }
      },
      controller: widget.controller,
      style: widget.textStyle,
      obscureText: !_isVisible,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        fillColor: widget.fillColor,
        contentPadding: EdgeInsets.all(widget.padding),
        filled: true,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
          icon: Icon(
            _isVisible ? Icons.visibility : Icons.visibility_off,
            color: widget.iconColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.borderColor,
            width: widget.borderWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.borderColor,
            width: widget.borderWidth,
          ),
        ),
      ),
    );
  }
}
