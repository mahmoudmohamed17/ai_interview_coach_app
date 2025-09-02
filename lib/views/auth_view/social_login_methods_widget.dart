import 'package:ai_interview_coach_app/core/constants/app_assets.dart';
import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:ai_interview_coach_app/views/auth_view/social_auth_button.dart';
import 'package:flutter/material.dart';

class SocailLoginMethodsWidget extends StatelessWidget {
  const SocailLoginMethodsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        SizedBox(
          width: double.infinity,
          child: SocialAuthButton(
            onPressed: () {},
            text: 'Continue with Google',
            imgIcon: AppAssets.google,
            textStyle: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(color: AppColors.primaryColor),
            backgrnColor: Theme.of(context).colorScheme.surface,
            borderColor: Theme.of(context).colorScheme.outline,
            borderRadius: 12,
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: SocialAuthButton(
            onPressed: () {},
            text: 'Continue with Facebook',
            imgIcon: AppAssets.facebook,
            textStyle: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(color: AppColors.primaryColor),
            backgrnColor: Theme.of(context).colorScheme.surface,
            borderColor: Theme.of(context).colorScheme.outline,
            borderRadius: 12,
          ),
        ),
      ],
    );
  }
}
