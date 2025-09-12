import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:ai_interview_coach_app/core/utilities/context_extension.dart';
import 'package:ai_interview_coach_app/core/utilities/handle_user_profile_picture.dart';
import 'package:ai_interview_coach_app/core/utilities/show_toast.dart';
import 'package:ai_interview_coach_app/core/widgets/custom_button.dart';
import 'package:ai_interview_coach_app/cubits/auth_cubit.dart';
import 'package:ai_interview_coach_app/cubits/auth_state.dart';
import 'package:ai_interview_coach_app/views/profile_view/custom_logout_dialog.dart';
import 'package:ai_interview_coach_app/views/profile_view/profile_view_app_bar.dart';
import 'package:ai_interview_coach_app/views/profile_view/user_personal_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoggedOut) {
          context.go('/');
          showToast(context, title: 'Logged out successfully!');
        }

        if (state is AuthError) {
          showToast(context, title: 'Something went wrong');
        }
      },
      builder: (context, state) {
        final cubit = context.read<AuthCubit>();

        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SafeArea(
            child: Column(
              children: [
                ProfileViewAppBar(userModel: cubit.userModel!),
                const SizedBox(height: 16),
                CircleAvatar(
                  radius: 72,
                  backgroundImage: handleUserProfilePicture(
                    cubit.userModel!.profilePicture,
                  ),
                ),
                const SizedBox(height: 24),
                UserPersonalInfoWidget(authCubit: cubit),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                    width: context.width,
                    child: CustomButton(
                      onPressed: () => showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => const CustomLogoutDialog(),
                      ),
                      borderRadius: 12,
                      backgrnColor: AppColors.redBtnColor,
                      child: Text(
                        'Log out',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 36),
              ],
            ),
          ),
        );
      },
    );
  }
}
