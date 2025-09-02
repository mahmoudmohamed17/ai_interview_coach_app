import 'package:ai_interview_coach_app/core/widgets/custom_button.dart';
import 'package:ai_interview_coach_app/cubits/auth_cubit.dart';
import 'package:ai_interview_coach_app/cubits/auth_state.dart';
import 'package:ai_interview_coach_app/views/auth_view/dont_have_an_account_widget.dart';
import 'package:ai_interview_coach_app/views/auth_view/forgot_password_button.dart';
import 'package:ai_interview_coach_app/views/auth_view/or_widget.dart';
import 'package:ai_interview_coach_app/views/auth_view/password_text_form_field_with_label.dart';
import 'package:ai_interview_coach_app/views/auth_view/social_login_methods_widget.dart';
import 'package:ai_interview_coach_app/views/auth_view/text_form_field_with_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

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
    final cubit = context.read<AuthCubit>();

    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sign in to your account',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Enter your email and password to log in',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 24),
          TextFormFieldWithLabel(
            controller: _emailController,
            label: 'Email',
            labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
            hintText: 'Type your email',
          ),
          const SizedBox(height: 16),
          PasswordTextFormFieldWithLabel(
            label: 'Password',
            controller: _passwordController,
          ),
          const SizedBox(height: 16),
          const Align(
            alignment: Alignment.centerRight,
            child: ForgotPasswordButton(),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              /// Change this later
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await cubit.logIn(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  setState(() {
                    _autovalidateMode = AutovalidateMode.disabled;
                  });
                } else {
                  setState(() {
                    _autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
              backgrnColor: Theme.of(context).colorScheme.primary,
              borderRadius: 12,
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return SpinKitThreeBounce(
                      color: Theme.of(context).colorScheme.onPrimary,
                      size: 20,
                      duration: const Duration(milliseconds: 500),
                    );
                  } else {
                    return Text(
                      'Log In',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          const SizedBox(height: 24),
          const OrWidget(),
          const SizedBox(height: 24),
          const SocailLoginMethodsWidget(),
          const SizedBox(height: 64),
          const DontHaveAnAccountWidget(),
        ],
      ),
    );
  }
}
