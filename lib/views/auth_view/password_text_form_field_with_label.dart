import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:ai_interview_coach_app/core/widgets/custom_password_text_form_field.dart';
import 'package:flutter/material.dart';

class PasswordTextFormFieldWithLabel extends StatelessWidget {
  const PasswordTextFormFieldWithLabel({
    super.key,
    required this.controller,
    required this.label,
  });

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(color: AppColors.secondaryColor),
        ),
        CustomPasswordTextFormField(
          controller: controller,
          hintText: 'Type your password',
          label: label,
          borderColor: AppColors.borderColor,
          hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppColors.secondaryColor,
            fontWeight: FontWeight.w400,
          ),
          textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w400,
          ),
          iconColor: AppColors.secondaryColor,
          borderRadius: 8,
          padding: 12,
        ),
      ],
    );
  }
}
