import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textStyle,
    this.backgrnColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.borderWidth = 1.0,
    this.borderPadding = 16.0,
    this.elevation = 0,
    this.shadowColor = Colors.transparent,
  });

  final VoidCallback onPressed;
  final String text;
  final TextStyle? textStyle;
  final Color backgrnColor;
  final Color borderColor;
  final Color shadowColor;
  final double borderWidth;
  final double borderPadding;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgrnColor,
        elevation: elevation,
        shadowColor: shadowColor,
        side: BorderSide(color: borderColor, width: borderWidth),
        padding: EdgeInsets.all(borderPadding),
      ),
      child: Text(text, style: textStyle),
    );
  }
}
