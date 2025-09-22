import 'package:ai_interview_coach_app/backend/models/quiz_session_model.dart';
import 'package:ai_interview_coach_app/views/home_view/recent_practice_sessions_section.dart';

/// A function that returns the count of quiz sessions taken in the current week.
/// Used with [RecentPracticeSessionsSection]
int getSessionsCountThisWeek(List<QuizSessionModel> sessions) {
  final now = DateTime.now();
  // Suppose that the week starts on Monday and ends on Sunday
  final beginningOfWeek = now.subtract(Duration(days: now.weekday - 1));
  final startOfWeek = DateTime(
    beginningOfWeek.year,
    beginningOfWeek.month,
    beginningOfWeek.day,
  );
  final endOfWeek = startOfWeek.add(const Duration(days: 7));

  final count = sessions.where((session) {
    final createdAt = session.createdAt;
    if (createdAt == null) return false;
    return createdAt.isAfter(startOfWeek) && createdAt.isBefore(endOfWeek);
  }).length;

  return count;
}
