import 'dart:developer';
import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:ai_interview_coach_app/cubits/auth_cubit.dart';
import 'package:ai_interview_coach_app/cubits/auth_state.dart';
import 'package:ai_interview_coach_app/views/auth_view/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          log('Auth Loading...');
        }
        if (state is AuthLoggedIn) {
          log('Loggen in!');
        }
        if (state is AuthError) {
          log(state.message);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back, color: AppColors.primaryColor),
          ),
          forceMaterialTransparency: true,
        ),
        body: const SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: LoginViewBody(),
            ),
          ),
        ),
      ),
    );
  }
}
