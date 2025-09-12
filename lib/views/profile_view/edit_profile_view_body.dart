import 'package:ai_interview_coach_app/core/utilities/context_extension.dart';
import 'package:ai_interview_coach_app/core/widgets/custom_button.dart';
import 'package:ai_interview_coach_app/cubits/auth_cubit.dart';
import 'package:ai_interview_coach_app/views/profile_view/edit_profile_view_app_bar.dart';
import 'package:ai_interview_coach_app/views/profile_view/edit_user_bio_widget.dart';
import 'package:ai_interview_coach_app/views/profile_view/edit_user_field_with_label.dart';
import 'package:ai_interview_coach_app/views/profile_view/editable_user_phone_number.dart';
import 'package:ai_interview_coach_app/views/profile_view/editable_user_profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.watch<AuthCubit>();

    return Column(
      children: [
        const EditProfileViewAppBar(),
        const SizedBox(height: 16),
        EditableUserProfilePicture(
          userPicture: authCubit.userModel!.profilePicture,
          onTap: (image) {},
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: EditUserBioWidget(
            initialValue: authCubit.userModel!.bio,
            onChanged: (value) {},
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: EditUserFieldWithLabel(
            initialValue: authCubit.userModel!.fullName,
            label: 'Full name',
            hintText: 'Edit your name',
            onChanged: (value) {},
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: EditableUserPhoneNumber(
            onCompleted: (code, phoneNumber) {},
            phoneNumber: authCubit.userModel!.phoneNumber,
            countryCode: authCubit.userModel!.countryCode,
          ),
        ),
        const SizedBox(height: 64),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SizedBox(
            width: context.width,
            child: CustomButton(
              onPressed: () {},
              backgrnColor: Theme.of(context).colorScheme.primary,
              borderRadius: 32,
              child: Text(
                'Update',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
