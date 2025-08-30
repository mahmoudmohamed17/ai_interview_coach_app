import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:ai_interview_coach_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class PasswordTextFormFieldWithLabel extends StatelessWidget {
  const PasswordTextFormFieldWithLabel({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        Text(
          'Password',
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(color: AppColors.secondaryColor),
        ),
        CustomTextFormField(
          controller: controller,
          hintText: 'Type your password',
          borderColor: AppColors.borderColor,
          hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppColors.secondaryColor,
            fontWeight: FontWeight.w400,
          ),
          borderRadius: 8,
          padding: 12,
        ),
      ],
    );
  }
}
