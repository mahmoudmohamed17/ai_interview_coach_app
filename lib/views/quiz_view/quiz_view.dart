import 'package:ai_interview_coach_app/ai/models/question_model.dart';
import 'package:ai_interview_coach_app/core/di/setup_locator.dart';
import 'package:ai_interview_coach_app/cubits/quiz_cubit.dart';
import 'package:ai_interview_coach_app/cubits/quiz_states.dart';
import 'package:ai_interview_coach_app/views/quiz_view/quiz_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key, required this.questions});
  final List<QuestionModel> questions;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<QuizCubit>(),
      child: BlocListener<QuizCubit, QuizStates>(
        listener: (context, state) {},
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SafeArea(child: QuizViewBody(questions: questions)),
        ),
      ),
    );
  }
}
