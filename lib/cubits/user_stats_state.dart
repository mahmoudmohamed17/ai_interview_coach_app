import 'package:ai_interview_coach_app/backend/models/user_statistics_model.dart';

abstract class UserStatsState {
  const UserStatsState();
}

final class UserStatsInitial extends UserStatsState {
  const UserStatsInitial();
}

final class UserStatsLoading extends UserStatsState {
  const UserStatsLoading();
}

final class UserStatsFilled extends UserStatsState {
  final UserStatisticsModel statsModel;
  
  const UserStatsFilled({required this.statsModel});
}

final class UserStatsError extends UserStatsState {
  final String message;

  const UserStatsError({required this.message});
}

final class UserStatsRefershing extends UserStatsState {
  final UserStatisticsModel statsModel;

  const UserStatsRefershing({required this.statsModel});
}
