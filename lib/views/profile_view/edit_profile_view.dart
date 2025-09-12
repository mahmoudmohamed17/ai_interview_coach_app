import 'package:ai_interview_coach_app/backend/models/user_data_model.dart';
import 'package:ai_interview_coach_app/core/utilities/show_toast.dart';
import 'package:ai_interview_coach_app/cubits/auth_cubit.dart';
import 'package:ai_interview_coach_app/cubits/auth_state.dart';
import 'package:ai_interview_coach_app/views/profile_view/edit_profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key, required this.userModel});
  final UserDataModel userModel;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthUpdated) {
          context.pop();
          showToast(context, title: 'Profile update successfully!');
        }

        if (state is AuthError) {
          showToast(context, title: state.message);
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: SingleChildScrollView(
            child: EditProfileViewBody(userModel: userModel),
          ),
        ),
      ),
    );
  }
}
