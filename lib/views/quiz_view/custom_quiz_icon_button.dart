import 'package:flutter/material.dart';

class CustomQuizIconButton extends StatelessWidget {
  const CustomQuizIconButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.icon,
    this.labelColor,
    this.btnColor,
    this.borderColor,
    this.iconAlignment,
    this.iconColor,
  });
  final VoidCallback onPressed;
  final String label;
  final IconData icon;
  final Color? labelColor;
  final Color? btnColor;
  final Color? borderColor;
  final Color? iconColor;
  final IconAlignment? iconAlignment;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: btnColor,
        visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
        elevation: 0,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
      ),
      label: Text(
        label,
        style: Theme.of(
          context,
        ).textTheme.labelMedium?.copyWith(color: labelColor),
      ),
      icon: Icon(icon, color: iconColor, size: 16),
      iconAlignment: iconAlignment ?? IconAlignment.start,
    );
  }
}
