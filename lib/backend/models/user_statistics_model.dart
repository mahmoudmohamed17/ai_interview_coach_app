import 'package:ai_interview_coach_app/backend/services/supabase_database_service.dart';
import 'package:ai_interview_coach_app/backend/models/statistics_item_model.dart';

/// This class helps to extract the pure data from [getRecentUserStatistics()] method
/// @[SupabaseDatabaseService], and then use [StatisticsItemModel] to display the
/// the data at the desired format
class UserStatisticsModel {
  final int totalQuestions;
  final double averageScore;
  final int skillsImproved;

  const UserStatisticsModel({
    required this.totalQuestions,
    required this.averageScore,
    required this.skillsImproved,
  });
}
