import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccountWidget extends StatelessWidget {
  const AlreadyHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 4,
      children: [
        Text(
          'Already have an account?',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: AppColors.secondaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
          onPressed: () {},
          style: const ButtonStyle(
            visualDensity: VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
            padding: WidgetStatePropertyAll(EdgeInsets.zero),
          ),
          child: Text(
            'Log In',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
