import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:ai_interview_coach_app/core/utilities/context_extension.dart';
import 'package:ai_interview_coach_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          Image.asset('assets/logo.jpg', height: context.width * 0.55),
          const SizedBox(height: 24),
          Text(
            'Welcome to NovaPrep',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Welcome Mahmoud!',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.primaryColor),
          ),
          const SizedBox(height: 4),
          Text(
            'Ready to ace your interview?',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.primaryColor),
          ),
          const SizedBox(height: 4),
          Text(
            'Your AI-powered partener for interview success',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.primaryColor),
          ),
          const SizedBox(height: 64),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              onPressed: () {},
              backgrnColor: AppColors.primaryColor,
              borderRadius: 12,
              child: Text(
                'Start Interview',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(color: Colors.white),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
