import 'package:ai_interview_coach_app/cubits/auth_cubit.dart';
import 'package:ai_interview_coach_app/views/profile_view/edit_profile_view_app_bar.dart';
import 'package:ai_interview_coach_app/views/profile_view/edit_user_field_with_label.dart';
import 'package:ai_interview_coach_app/views/profile_view/editable_user_profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.watch<AuthCubit>();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            const EditProfileViewAppBar(),
            const SizedBox(height: 16),
            EditableUserProfilePicture(
              userPicture: authCubit.userModel!.profilePicture,
              onTap: (image) {},
            ),
            const SizedBox(height: 16),
            EditUserFieldWithLabel(
              initialValue: authCubit.userModel!.fullName,
              label: 'Full name',
              hintText: 'Edit your name',
              onFieldSubmitted: (value) {},
            ),
            EditUserFieldWithLabel(
              initialValue: authCubit.userModel!.fullName,
              label: 'Full name',
              hintText: 'Edit your name',
              onFieldSubmitted: (value) {},
            ),
            EditUserFieldWithLabel(
              initialValue: authCubit.userModel!.fullName,
              label: 'Full name',
              hintText: 'Edit your name',
              onFieldSubmitted: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
