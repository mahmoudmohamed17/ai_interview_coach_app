import 'package:ai_interview_coach_app/backend/models/quiz_session_model.dart';
import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:ai_interview_coach_app/core/utilities/generate_color.dart';
import 'package:ai_interview_coach_app/views/recent_session_details_view/recent_sessions_details_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecentSessionDetailsViewBody extends StatelessWidget {
  const RecentSessionDetailsViewBody({super.key, required this.model});
  final QuizSessionModel model;

  @override
  Widget build(BuildContext context) {
    final color = generateColor(model.score!);

    return ListView(
      children: [
        const RecentSessionsDetailsAppBar(),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            spacing: 8,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                model.topic ?? "Unknown Topic",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                DateFormat("EEEE, d MMM y • h:mm a").format(model.createdAt!),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              Text(
                "${model.score!.round()}% Score",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Chip(
                label: Text(
                  model.difficulty ?? "N/A",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Stats Grid
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,

          children: [
            _statCard(
              context,
              label: "Total Questions",
              value: "${model.totalQuestions}",
              color: AppColors.greenIconColor,
            ),
            _statCard(
              context,
              label: "Correct",
              value: "${model.correctAnswers}",
              color: AppColors.purpleTextColor,
            ),
            _statCard(
              context,
              label: "Wrong",
              value: "${model.wrongAnswers}",
              color: AppColors.blueIconColor,
            ),
            _statCard(
              context,
              label: "Duration",
              value: "${model.timeSpent}",
              color: AppColors.orangeIconColor,
            ),
          ],
        ),
      ],
    );
  }

  Widget _statCard(
    BuildContext context, {
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [color, Theme.of(context).colorScheme.tertiaryContainer],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
