import 'package:ai_interview_coach_app/backend/services/supabase_database_service.dart';
import 'package:ai_interview_coach_app/backend/models/statistics_item_model.dart';
import 'package:equatable/equatable.dart';

/// This class helps to extract the pure data from [getRecentUserStatistics()] method
/// @[SupabaseDatabaseService], and then use [StatisticsItemModel] to display the
/// the data at the desired format
class UserStatisticsModel extends Equatable {
  final int questionsPracticed;
  final double averageScore;
  final int skillsImproved;

  const UserStatisticsModel({
    required this.questionsPracticed,
    required this.averageScore,
    required this.skillsImproved,
  });

  const UserStatisticsModel.empty()
    : questionsPracticed = 0,
      averageScore = 0.0,
      skillsImproved = 0;

  Map<String, dynamic> toJson() {
    return {
      'questions_practiced': questionsPracticed,
      'average_score': averageScore,
      'skills_improved': skillsImproved,
    };
  }

  factory UserStatisticsModel.fromJson(Map<String, dynamic> json) {
    return UserStatisticsModel(
      questionsPracticed: json['questions_practiced'],
      averageScore: (json['average_score'] as num).toDouble(),
      skillsImproved: json['skills_improved'],
    );
  }

  UserStatisticsModel copyWith({
    int? questionsPracticed,
    double? averageScore,
    int? skillsImproved,
  }) {
    return UserStatisticsModel(
      questionsPracticed: questionsPracticed ?? this.questionsPracticed,
      averageScore: averageScore ?? this.averageScore,
      skillsImproved: skillsImproved ?? this.skillsImproved,
    );
  }

  @override
  String toString() {
    return 'UserStatisticsModel{questionsPracticed: $questionsPracticed, averageScore: $averageScore, skillsImproved: $skillsImproved}';
  }

  @override
  List<Object?> get props => [questionsPracticed, averageScore, skillsImproved];

  bool get isEmpty => this == const UserStatisticsModel.empty();
}
