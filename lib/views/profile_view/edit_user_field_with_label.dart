import 'package:ai_interview_coach_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class EditUserFieldWithLabel extends StatelessWidget {
  const EditUserFieldWithLabel({
    super.key,
    required this.initialValue,
    required this.label,
    required this.hintText,
    this.onFieldSubmitted,
  });
  final String initialValue;
  final String label;
  final String hintText;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        CustomTextFormField(
          initialValue: initialValue,
          hintText: hintText,
          onFieldSubmitted: onFieldSubmitted,
          fillColor: Theme.of(context).colorScheme.surface,
          borderColor: Theme.of(context).colorScheme.outline,
          hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w400,
          ),
          textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w400,
          ),
          borderRadius: 8,
          padding: 12,
        ),
      ],
    );
  }
}
