import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        const Expanded(child: Divider(color: AppColors.secondaryColor)),
        Text(
          'Or',
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(color: AppColors.secondaryColor),
        ),
        const Expanded(child: Divider(color: AppColors.secondaryColor)),
      ],
    );
  }
}
