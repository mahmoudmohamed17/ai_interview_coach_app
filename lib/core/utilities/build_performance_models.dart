import 'package:ai_interview_coach_app/backend/models/performance_breackdown_model.dart';

List<PerformanceBreakdownModel> buildPerformanceModels({
  required double technicalKnowledge,
  required double problemSolving,
  required double bestPractices,
  required String quizId,
  required String userId,
}) {
  final items = [
    PerformanceBreakdownModel(
      quizId: quizId,
      category: 'Technical Knowledge',
      score: technicalKnowledge,
      createdAt: DateTime.now(),
    ),
    PerformanceBreakdownModel(
      quizId: quizId,
      category: 'Problem Solving',
      score: problemSolving,
      createdAt: DateTime.now(),
    ),
    PerformanceBreakdownModel(
      quizId: quizId,
      category: 'Best Practices',
      score: bestPractices,
      createdAt: DateTime.now(),
    ),
  ];
  return items;
}
