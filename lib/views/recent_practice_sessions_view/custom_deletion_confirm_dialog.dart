import 'package:ai_interview_coach_app/core/routing/routes.dart';
import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:ai_interview_coach_app/core/utilities/show_toast.dart';
import 'package:ai_interview_coach_app/cubits/recent_sessions_cubit.dart';
import 'package:ai_interview_coach_app/cubits/recent_sessions_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_overlay/loading_overlay.dart';

class CustomDeletionConfirmDialog extends StatelessWidget {
  const CustomDeletionConfirmDialog({
    super.key,
    required this.label,
    required this.onDelete,
  });
  final String label;
  final Future<void> Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecentSessionsCubit, RecentSessionsState>(
      listener: (context, state) {
        if (state is PracticeSessionsInitial ||
            state is PracticeSessionsFilled) {
          context.go(Routes.recentPracticeSessionsView);
          showToast(context, title: 'Session deleted successfully!');
        }
        if (state is PracticeSessionsError) {
          context.pop();
          showToast(context, title: 'Erro while deleting the session');
        }
      },
      builder: (context, state) {
        return LoadingOverlay(
          isLoading: state is PracticeSessionsRefreshing,
          child: AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
            icon: Icon(
              FontAwesomeIcons.circleExclamation,
              color: Theme.of(context).colorScheme.primary,
              size: 48,
            ),
            title: Text(
              label,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 16,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => context.pop(),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.primary,
                      ),
                      shape: const WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                    child: Text(
                      'No',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      await onDelete();
                    },
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
                      'Delete',
                      style: Theme.of(
                        context,
                      ).textTheme.labelLarge?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
