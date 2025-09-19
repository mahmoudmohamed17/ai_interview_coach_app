import 'package:ai_interview_coach_app/backend/models/user_statistics_model.dart';
import 'package:ai_interview_coach_app/backend/services/supabase_auth_service.dart';
import 'package:ai_interview_coach_app/backend/services/supabase_database_service.dart';
import 'package:ai_interview_coach_app/cubits/user_stats_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserStatsCubit extends Cubit<UserStatsState> {
  UserStatsCubit(this.supabaseDatabaseService, this.supabaseAuthService)
    : super(const UserStatsInitial()) {
    fetchStats();
  }

  final SupabaseDatabaseService supabaseDatabaseService;
  final SupabaseAuthService supabaseAuthService;

  UserStatisticsModel _statsModel = const UserStatisticsModel.empty();

  Future<void> fetchStats() async {
    emit(const UserStatsLoading());
    try {
      _statsModel = await supabaseDatabaseService.getRecentUserStatistics(
        supabaseAuthService.currentUser!.id,
      );
      emit(
        _statsModel.isEmpty
            ? const UserStatsInitial()
            : UserStatsFilled(statsModel: _statsModel),
      );
    } catch (e) {
      emit(UserStatsError(message: e.toString()));
    }
  }

  Future<void> refreshStats() async {
    emit(UserStatsRefershing(statsModel: _statsModel));
    try {
      _statsModel = await supabaseDatabaseService.getRecentUserStatistics(
        supabaseAuthService.currentUser!.id,
      );
      emit(UserStatsFilled(statsModel: _statsModel));
    } catch (e) {
      emit(UserStatsError(message: e.toString()));
    }
  }
}
