import 'package:ai_interview_coach_app/views/home_view/recent_practice_sessions_section.dart';
import 'package:ai_interview_coach_app/cubits/recent_sessions_cubit.dart';

/// Used to display the recent quizzes info the user took
/// Model used @[RecentPracticeSessionsSection] and [RecentSessionsCubit]
class QuizSessionModel {
  final String? id;
  final String? userId;
  final DateTime? createdAt;
  final String? timeSpent;
  final String? topic;
  final int? totalQuestions;
  final int? answeredQuestions;
  final int? correctAnswers;
  final int? wrongAnswers;
  final double? score;
  final String? overview;
  final String? difficulty;

  const QuizSessionModel({
    this.id,
    this.userId,
    this.createdAt,
    this.timeSpent,
    this.topic,
    this.totalQuestions,
    this.answeredQuestions,
    this.correctAnswers,
    this.wrongAnswers,
    this.score,
    this.overview,
    this.difficulty,
  });

  @override
  String toString() {
    return 'QuizSessionModel(id: $id, userId: $userId, createdAt: $createdAt, timeSpent: $timeSpent, topic: $topic, totalQuestions: $totalQuestions, answeredQuestions: $answeredQuestions, correctAnswers: $correctAnswers, wrongAnswers: $wrongAnswers, score: $score, overview: $overview, difficulty: $difficulty)';
  }

  factory QuizSessionModel.fromJson(Map<String, dynamic> json) {
    return QuizSessionModel(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      timeSpent: json['time_spent'] as String?,
      topic: json['topic'] as String?,
      totalQuestions: json['total_questions'] as int?,
      answeredQuestions: json['answered_questions'] as int?,
      correctAnswers: json['correct_answers'] as int?,
      wrongAnswers: json['wrong_answers'] as int?,
      score: (json['score'] as num?)?.toDouble(),
      overview: json['overview'] as String?,
      difficulty: json['difficulty'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final data = {
      'user_id': userId,
      'created_at': createdAt?.toIso8601String(),
      'time_spent': timeSpent,
      'topic': topic,
      'total_questions': totalQuestions,
      'answered_questions': answeredQuestions,
      'correct_answers': correctAnswers,
      'wrong_answers': wrongAnswers,
      'score': score,
      'overview': overview,
      'difficulty': difficulty,
    };
    
    // Incase we add the quiz session not to store it as a null and causing
    // issues with later operations
    if (id != null) {
      data['id'] = id;
    }

    return data;
  }

  QuizSessionModel copyWith({
    String? id,
    String? userId,
    DateTime? createdAt,
    String? timeSpent,
    String? topic,
    int? totalQuestions,
    int? answeredQuestions,
    int? correctAnswers,
    int? wrongAnswers,
    double? score,
    String? overview,
    String? difficulty,
  }) {
    return QuizSessionModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      timeSpent: timeSpent ?? this.timeSpent,
      topic: topic ?? this.topic,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      answeredQuestions: answeredQuestions ?? this.answeredQuestions,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      wrongAnswers: wrongAnswers ?? this.wrongAnswers,
      score: score ?? this.score,
      overview: overview ?? this.overview,
      difficulty: difficulty ?? this.difficulty,
    );
  }
}
