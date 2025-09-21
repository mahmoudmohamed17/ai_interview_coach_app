import 'package:ai_interview_coach_app/backend/models/performance_breackdown_model.dart';

List<PerformanceBreackdownModel> buildPerformanceModels({
  required double technicalKnowledge,
  required double problemSolving,
  required double bestPractices,
  required String quizId,
}) {
  final items = [
    PerformanceBreackdownModel(
      quizId: quizId,
      category: 'Technical Knowledge',
      score: technicalKnowledge,
    ),
    PerformanceBreackdownModel(
      quizId: quizId,
      category: 'Problem Solving',
      score: problemSolving,
    ),
    PerformanceBreackdownModel(
      quizId: quizId,
      category: 'Best Practices',
      score: bestPractices,
    ),
  ];
  return items;
}
