import 'package:ai_interview_coach_app/cubits/recent_sessions_cubit.dart';
import 'package:ai_interview_coach_app/views/recent_practice_sessions_view/custom_deletion_confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class RecentSessionsDetailsAppBar extends StatelessWidget {
  const RecentSessionsDetailsAppBar({super.key, required this.quizId});
  final String quizId;

  @override
  Widget build(BuildContext context) {
    final recentSessionsCubit = context.read<RecentSessionsCubit>();

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
            onPressed: () => context.pop(),
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.arrow_back),
          ),
          const SizedBox(width: 8),
          Text(
            'Sessions Details',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () => showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => CustomDeletionConfirmDialog(
                label: 'Are you sure to delete this session?',
                onDelete: () async {
                  await recentSessionsCubit.deleteQuizSession(quizId);
                },
              ),
            ),
            icon: const Icon(FontAwesomeIcons.solidTrashCan, size: 20),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
