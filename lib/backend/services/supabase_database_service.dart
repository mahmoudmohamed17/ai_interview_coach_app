import 'package:ai_interview_coach_app/backend/models/performance_breackdown_model.dart';
import 'package:ai_interview_coach_app/backend/models/quiz_session_model.dart';
import 'package:ai_interview_coach_app/backend/models/suggestion_model.dart';
import 'package:ai_interview_coach_app/backend/models/user_statistics_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDatabaseService {
  final _client = Supabase.instance.client;

  /// For [quiz_sessions] table
  Future<void> addQuizSession(QuizSessionModel model) async {
    await _client.from('quiz_sessions').insert(model.toJson());
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
  /// Like how manay questions solved, average score and the skills improved
  /// Need to extract all these data first, make the instance and then return it!
  Future<UserStatisticsModel> getRecentUserStatistics(String userId) async {
    // Get the quizzes of the user first
    final results = await _client
        .from('quiz_sessions')
        .select()
        .eq('user_id', userId);
    final quizzes = results
        .map((item) => QuizSessionModel.fromJson(item))
        .toList();

    // Check if the user hasn't take any quiz yet
    if (quizzes.isEmpty) {
      return const UserStatisticsModel(
        totalQuestions: 0,
        averageScore: 0.0,
        skillsImproved: 0,
      );
    }

    // Calculate total questions solved and scores
    double totalScore = 0.0;
    int totalQuestions = 0;
    for (var item in quizzes) {
      totalScore += item.score ?? 0.0;
      totalQuestions += item.totalQuestions ?? 0;
    }
    final avgScore = totalScore / quizzes.length;

    // Get the skills improved form performance_breakdown table
    final breakdownResults = await _client
        .from('performance_breakdown')
        .select('category')
        .inFilter('quiz_id', quizzes.map((q) => q.id!).toList());
    final skillsImproved = breakdownResults
        .map((item) => item['category'])
        .toSet()
        .length;
        
    return UserStatisticsModel(
      totalQuestions: totalQuestions,
      averageScore: avgScore,
      skillsImproved: skillsImproved,
    );
  }
}
