import 'package:ai_interview_coach_app/backend/models/performance_breackdown_model.dart';

List<PerformanceBreackdownModel> buildPerformanceModels(
  List<double> values,
  String quizId,
) {
  final items = [
    PerformanceBreackdownModel(
      quizId: quizId,
      category: 'Technical Knowledge',
      score: values[0],
    ),
    PerformanceBreackdownModel(
      quizId: quizId,
      category: 'Problem Solving',
      score: values[1],
    ),
    PerformanceBreackdownModel(
      quizId: quizId,
      category: 'Best Practices',
      score: values[2],
    ),
  ];
  return items;
}
