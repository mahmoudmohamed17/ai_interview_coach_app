import 'dart:developer';

import 'package:ai_interview_coach_app/backend/models/performance_breackdown_model.dart';
import 'package:ai_interview_coach_app/backend/models/quiz_session_model.dart';
import 'package:ai_interview_coach_app/backend/models/suggestion_model.dart';
import 'package:ai_interview_coach_app/backend/models/user_statistics_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDatabaseService {
  final _client = Supabase.instance.client;

  /// Add a quiz session for a user [userId]
  Future<QuizSessionModel> addQuizSession(QuizSessionModel model) async {
    final result = await _client
        .from('quiz_sessions')
        .insert(model.toJson())
        .select()
        .single();
    log('Quiz sessions returned: $result');
    return QuizSessionModel.fromJson(result);
  }

  /// Get the current quiz sessions for a user [userId]
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

  /// Update a quiz session with a [quizId] for a user [userId]
  Future<QuizSessionModel> updateQuizSession(QuizSessionModel model) async {
    final result = await _client
        .from('quiz_sessions')
        .update(model.toJson())
        .eq('id', model.id!)
        .select()
        .single();
    return QuizSessionModel.fromJson(result);
  }

  /// Delete a single quiz sessions with a [quizId].
  /// And return a list of the remaining items for user [userId]
  Future<List<QuizSessionModel>> deleteQuizSession(
    String quizId,
    String userId,
  ) async {
    // Delete the item first
    await _client.from('quiz_sessions').delete().eq('id', quizId);

    // Then get the remaining items that related to the user
    final items = await getQuizSessions(userId);
    return items;
  }

  /// Delete all quiz sessions for a user [userId]
  Future<void> deleteUserSessions(String userId) async {
    await _client.from('quiz_sessions').delete().eq('user_id', userId);
  }

  /// Add performance breakdown item for a quiz session with a [quizId]
  Future<void> addPerformanceItems(
    List<PerformanceBreakdownModel> models,
  ) async {
    final items = models.map((item) => item.toJson()).toList();
    await _client.from('performance_breakdown').insert(items);
  }

  /// Get the performance breakdown items for a quiz session with a [quizId]
  Future<List<PerformanceBreakdownModel>> getPerformanceItems(
    String quizId,
  ) async {
    final result = await _client
        .from('performance_breakdown')
        .select()
        .eq('quiz_id', quizId);
    final items = result
        .map((item) => PerformanceBreakdownModel.fromJson(item))
        .toList();
    return items;
  }

  /// Delete the performance breakdown items for a quiz session with a [quizId]
  Future<void> deleteQuizPerformanceItems(String quizId) async {
    await _client.from('performance_breakdown').delete().eq('quiz_id', quizId);
  }

  /// Delete all performance breakdown items that related to quiz sessions
  /// which are also related to a user [userId]
  Future<void> deleteUserPerformanceItems(String userId) async {
    await _client.from('performance_breakdown').delete().eq('user_id', userId);
  }

  /// Add list of suggestions related to a quiz session with a [quizId]
  Future<void> addQuizSuggestions(List<SuggestionModel> models) async {
    final items = models.map((item) => item.toJson()).toList();
    await _client.from('suggestions').insert(items);
  }

  /// Get a list of suggestions related to a quiz session with a [quizId]
  Future<List<SuggestionModel>> getQuizSuggestions(String quizId) async {
    final result = await _client
        .from('suggestions')
        .select()
        .eq('quiz_id', quizId);
    final items = result.map((item) => SuggestionModel.fromJson(item)).toList();
    return items;
  }

  /// Delete all suggestions related to a quiz session with a [quizId]
  Future<void> deleteQuizSuggestions(String quizId) async {
    await _client.from('suggestions').select().eq('quiz_id', quizId);
  }

  /// Delete all suggestions that related to quiz sessions which
  /// are also related to a user [userId]
  Future<void> deleteUserSuggestions(String userId) async {
    await _client.from('suggestions').select().eq('user_id', userId);
  }

  /// To get the user's statistics about his recent progress
  /// like how many questions solved, average score and the skills improved.
  /// Using a single Remote Procedure Call (RCP) form Supabase we got the
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
