import 'package:ai_interview_coach_app/backend/models/interview_topic_model.dart';
import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:ai_interview_coach_app/views/quiz_view/interview_topic_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectInterviewTopicWidget extends StatelessWidget {
  const SelectInterviewTopicWidget({
    super.key,
    this.onSelected,
    required this.activeIndex,
  });
  final Function(InterviewTopicModel model, int index)? onSelected;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 10,
            children: [
              const Icon(
                FontAwesomeIcons.bookOpen,
                color: AppColors.blueIconColor,
                size: 18,
              ),
              Text(
                'Select Interview Topic',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 3.5,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: interviewTopics.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => onSelected?.call(interviewTopics[index], index),
              child: InterviewTopicItem(
                model: interviewTopics[index],
                isActive: index == activeIndex,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
