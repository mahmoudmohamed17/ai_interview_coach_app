import 'package:ai_interview_coach_app/views/home_view/recent_practice_sessions_section.dart';
import 'package:ai_interview_coach_app/cubits/practice_sessions_cubit.dart';

/// Used to display the recent quizzes info the user took
/// Model used @[RecentPracticeSessionsSection] and [PracticeSessionsCubit]
class QuizSessionModel {
  final String? id;
  final String? userId;
  final DateTime? createdAt;
  final String? timeSpent;
  final String? topic;
  final int? totalQuestions;
  final int? answeredQuestions;
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
    this.score,
    this.overview,
    this.difficulty,
  });

  @override
  String toString() {
    return 'QuizSessionModel(id: $id, userId: $userId, createdAt: $createdAt, topic: $topic, totalQuestions: $totalQuestions, answeredQuestions: $answeredQuestions, score: $score, overview: $overview, difficulty: $difficulty)';
  }

  factory QuizSessionModel.fromJson(Map<String, dynamic> json) {
    return QuizSessionModel(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      createdAt: json['created_at'] as DateTime?,
      timeSpent: json['time_spent'] as String?,
      topic: json['topic'] as String?,
      totalQuestions: json['total_questions'] as int?,
      answeredQuestions: json['answered_questions'] as int?,
      score: (json['score'] as num?)?.toDouble(),
      overview: json['overview'] as String?,
      difficulty: json['difficulty'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'created_at': createdAt?.toIso8601String(),
    'time_spent': createdAt?.toIso8601String(),
    'topic': topic,
    'total_questions': totalQuestions,
    'answered_questions': answeredQuestions,
    'score': score,
    'overview': overview,
    'difficulty': difficulty,
  };

  QuizSessionModel copyWith({
    String? id,
    String? userId,
    DateTime? createdAt,
    String? timeSpent,
    String? topic,
    int? totalQuestions,
    int? answeredQuestions,
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
      score: score ?? this.score,
      overview: overview ?? this.overview,
      difficulty: difficulty ?? this.difficulty,
    );
  }
}
