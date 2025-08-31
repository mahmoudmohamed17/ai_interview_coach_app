import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:ai_interview_coach_app/core/utilities/show_toast.dart';
import 'package:ai_interview_coach_app/core/widgets/custom_button.dart';
import 'package:ai_interview_coach_app/core/widgets/image_picking_widget.dart';
import 'package:ai_interview_coach_app/cubits/auth_cubit.dart';
import 'package:ai_interview_coach_app/cubits/auth_state.dart';
import 'package:ai_interview_coach_app/views/auth_view/already_have_an_account_widget.dart';
import 'package:ai_interview_coach_app/views/auth_view/password_text_form_field_with_label.dart';
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
  late TextEditingController _confirmPasswrodController;
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String? _profilePic;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswrodController = TextEditingController();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswrodController.dispose();
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
            'Sign up',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Create an account to continue',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: AppColors.secondaryColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 32),
          Align(
            child: ImagePickingWidget(onTap: (image) => _profilePic = image),
          ),
          const SizedBox(height: 16),
          TextFormFieldWithLabel(
            controller: _fullNameController,
            label: 'Full name',
            labelStyle: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(color: AppColors.secondaryColor),
            hintText: 'Type your full name',
          ),
          const SizedBox(height: 16),
          TextFormFieldWithLabel(
            controller: _emailController,
            label: 'Email',
            labelStyle: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(color: AppColors.secondaryColor),
            hintText: 'Type your email',
          ),
          const SizedBox(height: 16),
          PasswordTextFormFieldWithLabel(
            label: 'Password',
            controller: _passwordController,
          ),
          const SizedBox(height: 16),
          PasswordTextFormFieldWithLabel(
            label: 'Confirm password',
            controller: _confirmPasswrodController,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await cubit.signUp(
                    email: _emailController.text,
                    password: _passwordController.text,
                    userData: {
                      'full_name': _fullNameController.text,
                      'pofile_pic': _profilePic,
                    },
                  );
                  if (_passwordController.text !=
                      _confirmPasswrodController.text) {
                    setState(() {
                      _autovalidateMode = AutovalidateMode.always;
                      showToast(
                        context,
                        title: 'Passwords must be matched!',
                        type: ToastificationType.warning,
                      );
                    });
                  }
                  setState(() {
                    _autovalidateMode = AutovalidateMode.disabled;
                  });
                } else {
                  setState(() {
                    _autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
              backgrnColor: AppColors.primaryColor,
              borderRadius: 12,
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const SpinKitThreeBounce(
                      color: Colors.white,
                      size: 20,
                      duration: Duration(milliseconds: 500),
                    );
                  } else {
                    return Text(
                      'Register',
                      style: Theme.of(
                        context,
                      ).textTheme.labelLarge?.copyWith(color: Colors.white),
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
}
