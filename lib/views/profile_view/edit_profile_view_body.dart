import 'package:ai_interview_coach_app/backend/models/user_data_model.dart';
import 'package:ai_interview_coach_app/core/utilities/context_extension.dart';
import 'package:ai_interview_coach_app/core/widgets/custom_button.dart';
import 'package:ai_interview_coach_app/cubits/auth_cubit.dart';
import 'package:ai_interview_coach_app/cubits/auth_state.dart';
import 'package:ai_interview_coach_app/views/profile_view/edit_profile_view_app_bar.dart';
import 'package:ai_interview_coach_app/views/profile_view/edit_user_bio_widget.dart';
import 'package:ai_interview_coach_app/views/profile_view/edit_user_field_with_label.dart';
import 'package:ai_interview_coach_app/views/profile_view/editable_user_phone_number_widget.dart';
import 'package:ai_interview_coach_app/views/profile_view/editable_user_profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key, required this.userModel});
  final UserDataModel userModel;

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  String? _fullName;
  String? _profilePicture;
  String? _bio;
  String? _phoneNumber;
  String? _countryCode;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    return Column(
      children: [
        const EditProfileViewAppBar(),
        const SizedBox(height: 16),
        EditableUserProfilePicture(
          userPicture: widget.userModel.profilePicture,
          onTap: (value) => setState(() {
            _profilePicture = value;
          }),
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: EditUserBioWidget(
            initialValue: widget.userModel.bio,
            onChanged: (value) => setState(() {
              _bio = value;
            }),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: EditUserFieldWithLabel(
            initialValue: widget.userModel.fullName,
            label: 'Full name',
            hintText: 'Edit your name',
            onChanged: (value) => setState(() {
              _fullName = value;
            }),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: EditableUserPhoneNumberWidget(
            onNumberChanged: (value) => setState(() {
              _phoneNumber = value;
            }),
            onCodeChanged: (value) => setState(() {
              _countryCode = value;
            }),
            phoneNumber: widget.userModel.phoneNumber,
            countryCode: widget.userModel.countryCode,
          ),
        ),
        const SizedBox(height: 64),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SizedBox(
            width: context.width,
            child: CustomButton(
              onPressed: () async {
                await cubit.updateUser(
                  userDataModel: widget.userModel.copyWith(
                    fullName: _fullName,
                    profilePicture: _profilePicture,
                    bio: _bio,
                    phoneNumber: _phoneNumber,
                    countryCode: _countryCode,
                  ),
                );
              },
              backgrnColor: Theme.of(context).colorScheme.primary,
              borderRadius: 32,
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
                      'Update',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
