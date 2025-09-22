import 'package:ai_interview_coach_app/backend/models/quiz_session_model.dart';
import 'package:ai_interview_coach_app/core/utilities/get_sessions_count_this_week.dart';
import 'package:flutter/material.dart';

class RecentPracticeSessiosHeader extends StatelessWidget {
  const RecentPracticeSessiosHeader({super.key, required this.sessions});
  final List<QuizSessionModel> sessions;

  @override
  Widget build(BuildContext context) {
    return Row(
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
            '${getSessionsCountThisWeek(sessions)} This week',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.onTertiaryContainer,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
