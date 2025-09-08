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
  late TextEditingController _fullNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _bioController;

  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  String? _profilePicture;
  String? _phoneNumber;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _bioController = TextEditingController();
  }

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
          Align(
            child: ImagePickingWidget(
              onTap: (value) => _profilePicture = value,
            ),
          ),
          const SizedBox(height: 16),
          BioWidget(controller: _bioController),
          const SizedBox(height: 16),
          TextFormFieldWithLabel(
            controller: _fullNameController,
            label: 'Full name',
            labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
            hintText: 'Type your full name',
          ),
          const SizedBox(height: 16),
          TextFormFieldWithLabel(
            controller: _emailController,
            label: 'Email',
            labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
            hintText: 'Type your email',
          ),
          const SizedBox(height: 16),
          PhoneNumberWidget(onCompleted: (value) => _phoneNumber = value),
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
          SizedBox(
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
          ),
          const SizedBox(height: 32),
          const AlreadyHaveAnAccountWidget(),
        ],
      ),
    );
  }

  Future<void> _handleSignup(BuildContext context, AuthCubit cubit) async {
    if (_formKey.currentState!.validate()) {
      if (_passwordController.text != _confirmPasswordController.text) {
        setState(() {
          _autovalidateMode = AutovalidateMode.always;
          showToast(
            context,
            title: 'Passwords must be matched!',
            type: ToastificationType.warning,
          );
        });
      }
      await cubit.signUp(
        email: _emailController.text,
        password: _passwordController.text,
        userDataModel: UserDataModel(
          fullName: _fullNameController.text,
          profilePicture: _profilePicture ?? 'Insert default image here',
          bio: _bioController.text,
          phoneNumber: _phoneNumber ?? '+201111111111',
        ),
      );
      setState(() {
        _autovalidateMode = AutovalidateMode.disabled;
      });
    } else {
      setState(() {
        _autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
