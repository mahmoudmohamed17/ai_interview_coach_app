import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:ai_interview_coach_app/core/utilities/context_extension.dart';
import 'package:ai_interview_coach_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class InitAuthView extends StatelessWidget {
  const InitAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/logo.jpg', height: context.width * 0.60),
              Text(
                'Welcome to NovaPrep',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  onPressed: () {},
                  text: 'Log in',
                  textStyle: Theme.of(
                    context,
                  ).textTheme.labelLarge?.copyWith(color: Colors.white),

                  backgrnColor: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  onPressed: () {},
                  text: 'Sign up',
                  textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.primaryColor,
                  ),
                  borderColor: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
