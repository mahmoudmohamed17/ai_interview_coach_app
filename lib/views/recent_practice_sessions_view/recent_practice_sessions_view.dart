import 'package:ai_interview_coach_app/backend/models/quiz_session_model.dart';
import 'package:ai_interview_coach_app/views/recent_practice_sessions_view/expanded_practice_session_item.dart';
import 'package:ai_interview_coach_app/views/recent_practice_sessions_view/recent_practice_sessions_app_bar.dart';
import 'package:flutter/material.dart';

class RecentPracticeSessionsView extends StatelessWidget {
  const RecentPracticeSessionsView({super.key, required this.sessions});
  final List<QuizSessionModel> sessions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          const RecentPracticeSessionsAppBar(),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              spacing: 16,
              children: sessions
                  .map((model) => ExpandedPracticeSessionItem(model: model))
                  .toList(),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
