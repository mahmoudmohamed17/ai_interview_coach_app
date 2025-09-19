import 'package:ai_interview_coach_app/backend/models/quiz_session_model.dart';

abstract class RecentSessionsState {
  const RecentSessionsState();
}

final class PracticeSessionsInitial extends RecentSessionsState {
  const PracticeSessionsInitial();
}

final class PracticeSessionsLoading extends RecentSessionsState {
  const PracticeSessionsLoading();
}

final class PracticeSessionsFilled extends RecentSessionsState {
  final List<QuizSessionModel> currentSessions;

  const PracticeSessionsFilled({required this.currentSessions});
}

final class PracticeSessionsError extends RecentSessionsState {
  final String message;

  const PracticeSessionsError({required this.message});
}

class PracticeSessionsRefreshing extends RecentSessionsState {
  final List<QuizSessionModel> currentSessions;

  const PracticeSessionsRefreshing(this.currentSessions);
}
