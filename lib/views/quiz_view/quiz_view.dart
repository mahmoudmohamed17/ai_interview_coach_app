import 'package:ai_interview_coach_app/ai/models/question_model.dart';
import 'package:ai_interview_coach_app/views/quiz_view/quiz_view_body.dart';
import 'package:flutter/material.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key, required this.questions});
  final List<QuestionModel> questions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(child: QuizViewBody(questions: questions)),
    );
  }
}
