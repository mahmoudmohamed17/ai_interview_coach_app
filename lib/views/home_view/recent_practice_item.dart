import 'package:ai_interview_coach_app/backend/models/recent_practice_model.dart';
import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:ai_interview_coach_app/core/utilities/context_extension.dart';
import 'package:ai_interview_coach_app/core/utilities/generate_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RecentPracticeItem extends StatelessWidget {
  const RecentPracticeItem({super.key, required this.model});

  final RecentPracticeModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        spacing: 8,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.blueTintIconColor,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            padding: const EdgeInsets.all(8),
            child: const Icon(
              FontAwesomeIcons.play,
              color: AppColors.blueIconColor,
              size: 20,
            ),
          ),
          SizedBox(
            width: context.width * 0.40,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  model.practiceTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Yesterday • ${model.questionsNumber} questions',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border.all(color: generateColor(model.score)),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            padding: const EdgeInsets.all(4.0),
            child: Text(
              '${model.score.round()}% Score',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: generateColor(model.score),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
