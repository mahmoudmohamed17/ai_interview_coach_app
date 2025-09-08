import 'package:ai_interview_coach_app/core/constants/app_assets.dart';
import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:ai_interview_coach_app/core/utilities/context_extension.dart';
import 'package:ai_interview_coach_app/core/widgets/custom_button.dart';
import 'package:ai_interview_coach_app/views/profile_view/profile_view_app_bar.dart';
import 'package:ai_interview_coach_app/views/profile_view/user_personal_info_widget.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            const ProfileViewAppBar(),
            const SizedBox(height: 16),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(AppAssets.imagesUserPicture),
                ),
              ),
              height: 120,
              width: 120,
            ),
            const SizedBox(height: 24),
            const UserPersonalInfoWidget(),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: context.width,
                child: CustomButton(
                  onPressed: () {},
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
  }
}
