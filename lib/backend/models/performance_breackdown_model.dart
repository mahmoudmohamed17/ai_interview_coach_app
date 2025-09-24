class PerformanceBreakdownModel {
  final String? id;
  final DateTime? createdAt;
  final String? quizId;
  final String? category;
  final double? score;
  final String? userId;

  const PerformanceBreakdownModel({
    this.id,
    this.createdAt,
    this.quizId,
    this.category,
    this.score,
    this.userId,
  });

  @override
  String toString() {
    return 'PerformanceBreackdownModel(id: $id, createdAt: $createdAt, quizId: $quizId, category: $category, score: $score, userId: $userId)';
  }

  factory PerformanceBreakdownModel.fromJson(Map<String, dynamic> json) {
    return PerformanceBreakdownModel(
      id: json['id'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      quizId: json['quiz_id'] as String?,
      category: json['category'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      userId: json['user_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final data = {
      'created_at': createdAt?.toIso8601String(),
      'quiz_id': quizId,
      'category': category,
      'score': score,
      'user_id': userId,
    };

    // The same issue of QuizSessionModel
    if (id != null) {
      data['id'] = id;
    }

    return data;
  }

  PerformanceBreakdownModel copyWith({
    String? id,
    DateTime? createdAt,
    String? quizId,
    String? category,
    double? score,
    String? userId,
  }) {
    return PerformanceBreakdownModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      quizId: quizId ?? this.quizId,
      category: category ?? this.category,
      score: score ?? this.score,
      userId: userId ?? this.userId,
    );
  }
}
