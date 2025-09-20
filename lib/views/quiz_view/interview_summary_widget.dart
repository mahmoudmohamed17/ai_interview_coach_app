import 'package:ai_interview_coach_app/backend/models/interview_difficulty_level_model.dart';
import 'package:ai_interview_coach_app/backend/models/interview_topic_model.dart';
import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:ai_interview_coach_app/core/utilities/context_extension.dart';
import 'package:ai_interview_coach_app/core/widgets/custom_button.dart';
import 'package:ai_interview_coach_app/cubits/quiz_cubit.dart';
import 'package:ai_interview_coach_app/cubits/quiz_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InterviewSummaryWidget extends StatelessWidget {
  const InterviewSummaryWidget({
    super.key,
    required this.topicModel,
    required this.levelModel,
  });
  final InterviewTopicModel topicModel;
  final InterviewDifficultyLevelModel levelModel;

  @override
  Widget build(BuildContext context) {
    final quizCubit = context.read<QuizCubit>();

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 18,
        children: [
          _buildHeader(context),
          _buildTopic(context),
          _buildQuestionsNoAndDifficultyLevel(context),
          SizedBox(
            width: context.width,
            child: CustomButton(
              onPressed: () async {
                await quizCubit.fetchQuestions(
                  topic: topicModel.topic,
                  questionsCount: levelModel.questionsNumber,
                  difficultyLevel: levelModel.level,
                );
              },
              backgrnColor: Theme.of(context).colorScheme.primary,
              borderRadius: 12,
              child: BlocBuilder<QuizCubit, QuizStates>(
                builder: (context, state) {
                  if (state is QuizLoading) {
                    return SpinKitThreeBounce(
                      color: Theme.of(context).colorScheme.onPrimary,
                      size: 20,
                      duration: const Duration(milliseconds: 500),
                    );
                  } else {
                    return Text(
                      'Start Interview',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 6,
      children: [
        const Icon(
          FontAwesomeIcons.play,
          color: AppColors.purpleTextColor,
          size: 20,
        ),
        Text(
          'Interview Summary',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildTopic(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          'Topic',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        Row(
          spacing: 6,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(topicModel.icon, height: 20, width: 20),
            Text(
              topicModel.topic,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuestionsNoAndDifficultyLevel(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 52,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Difficulty',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Text(
              levelModel.level,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Questions',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Text(
              '${levelModel.questionsNumber} questions',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
