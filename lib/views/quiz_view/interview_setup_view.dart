import 'package:ai_interview_coach_app/core/di/setup_locator.dart';
import 'package:ai_interview_coach_app/core/routing/routes.dart';
import 'package:ai_interview_coach_app/core/utilities/show_toast.dart';
import 'package:ai_interview_coach_app/cubits/quiz_cubit.dart';
import 'package:ai_interview_coach_app/cubits/quiz_states.dart';
import 'package:ai_interview_coach_app/views/quiz_view/interview_setup_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class InterviewSetupView extends StatelessWidget {
  const InterviewSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<QuizCubit>(),
      child: BlocListener<QuizCubit, QuizStates>(
        listener: (context, state) {
          if (state is QuizLoaded) {
            context.push(Routes.quizView, extra: state.questions);
          }
          if (state is QuizFailed) {
            showToast(context, title: 'Error prepearing the interview');
          }
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: const SafeArea(child: InterviewSetupViewBody()),
        ),
      ),
    );
  }
}
