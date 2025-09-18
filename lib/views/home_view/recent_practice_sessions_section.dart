import 'package:ai_interview_coach_app/backend/models/quiz_session_model.dart';
import 'package:ai_interview_coach_app/views/home_view/recent_practice_item.dart';
import 'package:flutter/material.dart';

class RecentPracticeSessionsSection extends StatelessWidget {
  const RecentPracticeSessionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = const [
      QuizSessionModel(
        topic: 'System Design Practice',
        totalQuestions: 15,
        score: 85.0,
      ),
      QuizSessionModel(
        topic: 'Flutter Development Interview',
        totalQuestions: 15,
        score: 85.0,
      ),
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Practice Sessions',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: Theme.of(context).colorScheme.tertiaryContainer,
              ),
              padding: const EdgeInsets.all(6.0),
              child: Text(
                '3 This week',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),

        ...items.map((item) => RecentPracticeItem(model: item)),
      ],
    );
  }
}
