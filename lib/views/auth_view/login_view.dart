import 'package:ai_interview_coach_app/core/constants/app_constants.dart';
import 'package:ai_interview_coach_app/core/routing/routes.dart';
import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:ai_interview_coach_app/core/utilities/shared_prefs.dart';
import 'package:ai_interview_coach_app/core/utilities/show_toast.dart';
import 'package:ai_interview_coach_app/cubits/auth_cubit.dart';
import 'package:ai_interview_coach_app/cubits/auth_state.dart';
import 'package:ai_interview_coach_app/views/auth_view/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoggedIn) {
          showToast(
            context,
            title: 'Logged in successfully!',
            type: ToastificationType.success,
          );
          SharedPrefs.setBool(isUserAuthenticated, true);
          context.go(Routes.homeView);
        }
        if (state is AuthError) {
          showToast(
            context,
            title: state.message,
            type: ToastificationType.error,
          );
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
