import 'package:ai_interview_coach_app/backend/models/user_data_model.dart';
import 'package:ai_interview_coach_app/core/utilities/show_toast.dart';
import 'package:ai_interview_coach_app/core/widgets/custom_button.dart';
import 'package:ai_interview_coach_app/core/widgets/image_picking_widget.dart';
import 'package:ai_interview_coach_app/cubits/auth_cubit.dart';
import 'package:ai_interview_coach_app/cubits/auth_state.dart';
import 'package:ai_interview_coach_app/views/auth_view/already_have_an_account_widget.dart';
import 'package:ai_interview_coach_app/views/auth_view/bio_widget.dart';
import 'package:ai_interview_coach_app/views/auth_view/password_text_form_field_with_label.dart';
import 'package:ai_interview_coach_app/views/auth_view/phone_number_widget.dart';
import 'package:ai_interview_coach_app/views/auth_view/signup_view_body_label.dart';
import 'package:ai_interview_coach_app/views/auth_view/text_form_field_with_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:toastification/toastification.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _bioController = TextEditingController();

  String? _profilePicture;
  String? _phoneNumber;
  String? _countryCode;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _bioController.dispose();
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
          const SignupViewBodyLabel(),
          const SizedBox(height: 32),
          _buildProfilePicturePicker(),
          const SizedBox(height: 16),
          BioWidget(controller: _bioController),
          const SizedBox(height: 16),
          _buildFullNameField(context),
          const SizedBox(height: 16),
          _buildEmailField(context),
          const SizedBox(height: 16),
          _buildPhoneNumberField(),
          const SizedBox(height: 16),
          PasswordTextFormFieldWithLabel(
            label: 'Password',
            controller: _passwordController,
          ),
          const SizedBox(height: 16),
          PasswordTextFormFieldWithLabel(
            label: 'Confirm password',
            controller: _confirmPasswordController,
          ),
          const SizedBox(height: 24),
          _buildRegisterButton(context, cubit),
          const SizedBox(height: 32),
          const AlreadyHaveAnAccountWidget(),
        ],
      ),
    );
  }

  Widget _buildProfilePicturePicker() {
    return Align(
      child: ImagePickingWidget(
        onTap: (value) => setState(() => _profilePicture = value),
      ),
    );
  }

  Widget _buildFullNameField(BuildContext context) {
    return TextFormFieldWithLabel(
      controller: _fullNameController,
      label: 'Full name',
      labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: Theme.of(context).colorScheme.secondary,
      ),
      hintText: 'Type your full name',
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return TextFormFieldWithLabel(
      controller: _emailController,
      label: 'Email',
      labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: Theme.of(context).colorScheme.secondary,
      ),
      hintText: 'Type your email',
    );
  }

  Widget _buildPhoneNumberField() {
    return PhoneNumberWidget(
      onCompleted: (code, phoneNumber) {
        setState(() {
          _countryCode = code;
          _phoneNumber = phoneNumber;
        });
      },
    );
  }

  Widget _buildRegisterButton(BuildContext context, AuthCubit cubit) {
    return SizedBox(
      width: double.infinity,
      child: CustomButton(
        onPressed: () async {
          await _handleSignup(context, cubit);
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
                'Register',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> _handleSignup(BuildContext context, AuthCubit cubit) async {
    final formValid = _formKey.currentState?.validate() ?? false;
    if (!formValid) {
      setState(() => _autovalidateMode = AutovalidateMode.always);
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() => _autovalidateMode = AutovalidateMode.always);
      showToast(
        context,
        title: 'Passwords must be matched!',
        type: ToastificationType.warning,
      );
      return;
    }

    await cubit.signUp(
      email: _emailController.text,
      password: _passwordController.text,
      userDataModel: UserDataModel(
        fullName: _fullNameController.text,
        profilePicture: _profilePicture ?? 'Insert default image here',
        bio: _bioController.text,
        phoneNumber: _phoneNumber ?? '+201111111111',
        countryCode: _countryCode ?? '+20',
      ),
    );
    setState(() => _autovalidateMode = AutovalidateMode.disabled);
  }
}
