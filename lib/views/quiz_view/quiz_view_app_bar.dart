// import 'package:ai_interview_coach_app/views/quiz_view/quiz_timer_wigdet.dart';
import 'package:ai_interview_coach_app/core/routing/routes.dart';
import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class QuizViewAppBar extends StatelessWidget {
  const QuizViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.outline,
            offset: const Offset(0, 0.5),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Row(
        children: [
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => _buildAlertDialog(context),
            ),
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.arrow_back),
          ),
          Text(
            'Interview in Progress',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const Spacer(),
          // const QuizTimerWigdet(),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _buildAlertDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      icon: const CircleAvatar(
        backgroundColor: AppColors.redBtnColor,
        radius: 24,
        child: Icon(FontAwesomeIcons.exclamation, color: Colors.white),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Are you sure to terminate this session?',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => context.go(Routes.homeView),
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    AppColors.redBtnColor,
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                ),
                child: Text(
                  'Leave',
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge?.copyWith(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () => context.pop(),
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    AppColors.greenIconColor,
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                ),
                child: Text(
                  'Cancel',
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge?.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
