import 'package:ai_interview_coach_app/backend/models/statistics_item_model.dart';
import 'package:ai_interview_coach_app/backend/models/user_statistics_model.dart';
import 'package:ai_interview_coach_app/core/theme/app_colors.dart';

List<StatisticsItemModel> buildStatisticsItemsList(UserStatisticsModel model) {
  return [
    StatisticsItemModel(
      score: '${model.questionsPracticed}',
      category: 'Questions Practiced',
      color: AppColors.blueIconColor,
    ),
    StatisticsItemModel(
      score: '${model.averageScore}%',
      category: 'Average Score',
      color: AppColors.greenIconColor,
    ),
    StatisticsItemModel(
      score: '${model.skillsImproved}',
      category: 'Skills Improved',
      color: AppColors.purpleTextColor,
    ),
  ];
}
