import 'package:ai_interview_coach_app/ai/models/question_model.dart';
import 'package:ai_interview_coach_app/views/quiz_view/progress_bar_and_questions_widget.dart';
import 'package:ai_interview_coach_app/views/quiz_view/quiz_view_app_bar.dart';
import 'package:flutter/material.dart';

class QuizViewBody extends StatelessWidget {
  const QuizViewBody({super.key, required this.questions});
  final List<QuestionModel> questions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const QuizViewAppBar(),
        const SizedBox(height: 12),
        Expanded(child: ProgressBarAndQuestionsWidget(questions: questions)),
      ],
    );
  }
}
