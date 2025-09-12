import 'package:ai_interview_coach_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class EditUserBioWidget extends StatelessWidget {
  const EditUserBioWidget({
    super.key,
    required this.initialValue,
    this.onChanged,
  });
  final String initialValue;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        Text(
          'Bio',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        CustomTextFormField(
          initialValue: initialValue,
          hintText: 'Edit your bio',
          onChanged: onChanged,
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
          borderRadius: 32,
          padding: 12,
          maxLines: 3,
        ),
      ],
    );
  }
}
