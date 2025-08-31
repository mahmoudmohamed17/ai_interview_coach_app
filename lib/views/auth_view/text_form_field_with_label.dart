import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:ai_interview_coach_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class TextFormFieldWithLabel extends StatelessWidget {
  const TextFormFieldWithLabel({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.labelStyle,
  });

  final TextEditingController controller;
  final String label;
  final String hintText;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        Text(label, style: labelStyle),
        CustomTextFormField(
          controller: controller,
          hintText: hintText,
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
          borderRadius: 8,
          padding: 12,
        ),
      ],
    );
  }
}
