import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:ai_interview_coach_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class BioWidget extends StatelessWidget {
  const BioWidget({super.key, required this.controller});
  final TextEditingController controller;

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
        CustomTextField(
          controller: controller,
          hintText: 'Tell us more about you!',
          fillColor: Theme.of(context).colorScheme.surface,
          borderColor: AppColors.borderColor,
          hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppColors.secondaryColor,
            fontWeight: FontWeight.w400,
          ),
          textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w400,
          ),
          borderRadius: 32,
          maxLines: 3,
        ),
      ],
    );
  }
}
