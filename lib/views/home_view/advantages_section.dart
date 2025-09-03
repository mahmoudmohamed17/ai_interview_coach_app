import 'package:ai_interview_coach_app/backend/models/advantage_model.dart';
import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:ai_interview_coach_app/views/home_view/advantage_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdvantagesSection extends StatelessWidget {
  const AdvantagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      AdvantageModel(
        text: 'Targeted Practice',
        subText: 'Practice with questions tailored to your role and industry',
        icon: FontAwesomeIcons.bullseye,
        iconColor: AppColors.blueIconColor,
        iconbackgrnColor: AppColors.blueTintIconColor,
      ),
      AdvantageModel(
        text: 'AI Feedback',
        subText: 'Get instant, detailed feedback on your performance',
        icon: FontAwesomeIcons.bolt,
        iconColor: AppColors.greenIconColor,
        iconbackgrnColor: AppColors.greenTintIconColor,
      ),
      AdvantageModel(
        text: 'Track Progress',
        subText: 'Monitor your improvement across different skills',
        icon: FontAwesomeIcons.star,
        iconColor: AppColors.orangeIconColor,
        iconbackgrnColor: AppColors.orangeTintIconColor,
      ),
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: items.map((item) => AdvantageItem(model: item)).toList(),
    );
  }
}
