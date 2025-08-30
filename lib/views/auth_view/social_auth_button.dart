import 'package:flutter/material.dart';

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.imgIcon,
    this.textStyle,
    this.backgrnColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.borderWidth = 1.0,
    this.borderPadding = 16.0,
    this.elevation = 0,
    this.shadowColor = Colors.transparent,
    this.borderRadius,
  });

  final VoidCallback onPressed;
  final String text;
  final TextStyle? textStyle;
  final String imgIcon;
  final Color backgrnColor;
  final Color borderColor;
  final Color shadowColor;
  final double borderWidth;
  final double borderPadding;
  final double elevation;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgrnColor,
        elevation: elevation,
        shadowColor: shadowColor,
        side: BorderSide(color: borderColor, width: borderWidth),
        shape: borderRadius != null
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
              )
            : null,
        padding: EdgeInsets.all(borderPadding),
      ),
      icon: Image.asset(imgIcon, height: 24, width: 24),
      label: Text(text, style: textStyle),
    );
  }
}
