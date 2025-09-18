import 'dart:ui';
import 'package:ai_interview_coach_app/views/home_view/statistics_section.dart';

/// Used to display the user statistics for quizzes he took
/// Note: The model would be created right after the user take a quiz
/// Model used @[StatisticsSection]
class StatisticsItemModel {
  final String? score;
  final String? category;
  final Color? color;

  const StatisticsItemModel({this.score, this.category, this.color});
}
