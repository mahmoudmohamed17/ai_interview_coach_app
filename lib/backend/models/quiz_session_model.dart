class QuizSessionModel {
  final String? id;
  final String? userId;
  final String? createdAt;
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
      createdAt: json['created_at'] as String?,
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
    'created_at': createdAt,
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
    String? createdAt,
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
      topic: topic ?? this.topic,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      answeredQuestions: answeredQuestions ?? this.answeredQuestions,
      score: score ?? this.score,
      overview: overview ?? this.overview,
      difficulty: difficulty ?? this.difficulty,
    );
  }
}
