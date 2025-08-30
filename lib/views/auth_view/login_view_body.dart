import 'package:ai_interview_coach_app/core/routing/routes.dart';
import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:ai_interview_coach_app/core/widgets/custom_button.dart';
import 'package:ai_interview_coach_app/views/auth_view/dont_have_an_account_widget.dart';
import 'package:ai_interview_coach_app/views/auth_view/or_widget.dart';
import 'package:ai_interview_coach_app/views/auth_view/password_text_form_field_with_label.dart';
import 'package:ai_interview_coach_app/views/auth_view/social_login_methods_widget.dart';
import 'package:ai_interview_coach_app/views/auth_view/text_form_field_with_label.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sign in to your account',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Enter your email and password to log in',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppColors.secondaryColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 24),
        TextFormFieldWithLabel(
          controller: _emailController,
          label: 'Email',
          labelStyle: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(color: AppColors.secondaryColor),
          hintText: 'Type your email',
        ),
        const SizedBox(height: 16),
        PasswordTextFormFieldWithLabel(
          label: 'Password',
          controller: _passwordController,
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {},
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            child: Text(
              'Forgot password?',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: CustomButton(
            /// Change this later
            onPressed: () => context.push(Routes.mainView),
            text: 'Log In',
            textStyle: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(color: Colors.white),
            backgrnColor: AppColors.primaryColor,
            borderRadius: 12,
          ),
        ),
        const SizedBox(height: 24),
        const OrWidget(),
        const SizedBox(height: 24),
        const SocailLoginMethodsWidget(),
        const SizedBox(height: 64),
        const DontHaveAnAccountWidget(),
      ],
    );
  }
}
