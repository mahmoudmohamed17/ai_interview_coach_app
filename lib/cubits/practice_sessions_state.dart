import 'package:ai_interview_coach_app/backend/models/quiz_session_model.dart';

abstract class PracticeSessionsState {
  const PracticeSessionsState();
}

final class PracticeSessionsInitial extends PracticeSessionsState {
  const PracticeSessionsInitial();
}

final class PracticeSessionsLoading extends PracticeSessionsState {
  const PracticeSessionsLoading();
}

final class PracticeSessionsFilled extends PracticeSessionsState {
  final List<QuizSessionModel> currentSessions;

  const PracticeSessionsFilled({required this.currentSessions});
}

final class PracticeSessionsError extends PracticeSessionsState {
  final String message;

  const PracticeSessionsError({required this.message});
}

class PracticeSessionsRefreshing extends PracticeSessionsState {
  final List<QuizSessionModel> currentSessions;

  const PracticeSessionsRefreshing(this.currentSessions);
}
