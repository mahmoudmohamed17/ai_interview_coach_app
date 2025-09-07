import 'package:ai_interview_coach_app/backend/models/interview_difficulty_level_model.dart';
import 'package:ai_interview_coach_app/backend/models/interview_topic_model.dart';
import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:ai_interview_coach_app/core/utilities/context_extension.dart';
import 'package:ai_interview_coach_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InterviewSummaryWidget extends StatelessWidget {
  const InterviewSummaryWidget({
    super.key,
    required this.topic,
    required this.level,
  });
  final InterviewTopicModel topic;
  final InterviewDifficultyLevelModel level;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 18,
        children: [
          /// Header
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 6,
            children: [
              const Icon(
                FontAwesomeIcons.play,
                color: AppColors.purpleTextColor,
                size: 20,
              ),
              Text(
                'Interview Summary',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          /// Topic
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(
                'Topic',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Row(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(topic.icon, height: 20, width: 20),
                  Text(
                    topic.label,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ],
          ),

          /// Questions number and difficulty level
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 52,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Difficulty',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Text(
                    level.label,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Questions',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Text(
                    '${level.questionsNumber} questions',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: context.width,
            child: CustomButton(
              onPressed: () {},
              backgrnColor: Theme.of(context).colorScheme.primary,
              borderRadius: 12,
              child: Text(
                'Start Interview',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
