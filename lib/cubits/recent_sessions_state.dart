import 'package:ai_interview_coach_app/backend/models/performance_breackdown_model.dart';
import 'package:ai_interview_coach_app/backend/models/quiz_session_model.dart';
import 'package:ai_interview_coach_app/backend/models/suggestion_model.dart';

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

final class PracticeSessionLoading extends RecentSessionsState {}

final class PracticeSessionLoaded extends RecentSessionsState {
  final List<PerformanceBreakdownModel> performanceModel;
  final List<SuggestionModel> suggestions;

  PracticeSessionLoaded({
    required this.performanceModel,
    required this.suggestions,
  });
}

final class PracticeSessionError extends RecentSessionsState {
  final String message;

  PracticeSessionError({required this.message});
}

final class PracticeSessionsError extends RecentSessionsState {
  final String message;

  const PracticeSessionsError({required this.message});
}

class PracticeSessionsRefreshing extends RecentSessionsState {
  final List<QuizSessionModel> currentSessions;

  const PracticeSessionsRefreshing(this.currentSessions);
}

class PracticeSessionsNavigating extends RecentSessionsState {
  const PracticeSessionsNavigating();
}
