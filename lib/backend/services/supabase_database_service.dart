import 'package:ai_interview_coach_app/backend/models/performance_breackdown_model.dart';
import 'package:ai_interview_coach_app/backend/models/quiz_session_model.dart';
import 'package:ai_interview_coach_app/backend/models/suggestion_model.dart';
import 'package:ai_interview_coach_app/backend/models/user_statistics_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDatabaseService {
  final _client = Supabase.instance.client;

  /// For [quiz_sessions] table
  Future<QuizSessionModel> addQuizSession(QuizSessionModel model) async {
    final result = await _client
        .from('quiz_sessions')
        .insert(model.toJson())
        .select()
        .single();
    return QuizSessionModel.fromJson(result);
  }

  Future<List<QuizSessionModel>> getQuizSessions(String userId) async {
    final result = await _client
        .from('quiz_sessions')
        .select()
        .eq('user_id', userId);
    final items = result
        .map((item) => QuizSessionModel.fromJson(item))
        .toList();
    return items;
  }

  Future<QuizSessionModel> updateQuizSession(QuizSessionModel model) async {
    final result = await _client
        .from('quiz_sessions')
        .update(model.toJson())
        .eq('id', model.id!)
        .select()
        .single();
    return QuizSessionModel.fromJson(result);
  }

  Future<void> deleteQuizSession(String quizId) async {
    await _client.from('quiz_sessions').delete().eq('id', quizId);
  }

  /// For [performance_breakdown] table
  Future<void> addPerformanceBreackdownItems(
    List<PerformanceBreackdownModel> models,
  ) async {
    final items = models.map((item) => item.toJson());
    await _client.from('performance_breakdown').insert(items);
  }

  Future<List<PerformanceBreackdownModel>> getPerformanceBreakdownItems(
    String quizId,
  ) async {
    final result = await _client
        .from('performance_breakdown')
        .select()
        .eq('quiz_id', quizId);
    final items = result
        .map((item) => PerformanceBreackdownModel.fromJson(item))
        .toList();
    return items;
  }

  /// For [suggestions] table
  Future<void> addSuggestions(List<SuggestionModel> models) async {
    final items = models.map((item) => item.toJson());
    await _client.from('suggestions').insert(items);
  }

  Future<List<SuggestionModel>> getSuggestions(String quizId) async {
    final result = await _client
        .from('suggestions')
        .select()
        .eq('quiz_id', quizId);
    final items = result.map((item) => SuggestionModel.fromJson(item)).toList();
    return items;
  }

  /// To get the user's statistics about his recent progress
  /// Like how many questions solved, average score and the skills improved.
  /// Using a single Remote Procedure Call (RCP) form Supabase; we got the
  /// needed value to create the instance.
  Future<UserStatisticsModel> getRecentUserStatistics(String userId) async {
    final response = await _client.rpc(
      'get_user_statistics',
      params: {'p_user_id': userId},
    );
    final data = response as Map<String, dynamic>;
    if (data.isEmpty) {
      return const UserStatisticsModel.empty();
    }
    final model = UserStatisticsModel.fromJson(data);
    return model;
  }
}
