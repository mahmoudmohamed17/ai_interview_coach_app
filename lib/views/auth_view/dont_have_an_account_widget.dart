import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: [
        Text(
          'Don\'t have an account?',
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(color: AppColors.secondaryColor),
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
            'Sign Up',
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
