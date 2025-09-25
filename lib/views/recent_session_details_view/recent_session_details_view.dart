import 'package:ai_interview_coach_app/backend/models/quiz_session_model.dart';
import 'package:ai_interview_coach_app/views/recent_session_details_view/recent_session_details_view_body.dart';
import 'package:flutter/material.dart';

class RecentSessionDetailsView extends StatelessWidget {
  const RecentSessionDetailsView({super.key, required this.model});
  final QuizSessionModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: RecentSessionDetailsViewBody(model: model),
    );
  }
}
