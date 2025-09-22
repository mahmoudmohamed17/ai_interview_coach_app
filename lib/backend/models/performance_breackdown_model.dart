class PerformanceBreackdownModel {
  final String? id;
  final DateTime? createdAt;
  final String? quizId;
  final String? category;
  final double? score;

  const PerformanceBreackdownModel({
    this.id,
    this.createdAt,
    this.quizId,
    this.category,
    this.score,
  });

  @override
  String toString() {
    return 'PerformanceBreackdownModel(id: $id, createdAt: $createdAt, quizId: $quizId, category: $category, score: $score)';
  }

  factory PerformanceBreackdownModel.fromJson(Map<String, dynamic> json) {
    return PerformanceBreackdownModel(
      id: json['id'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      quizId: json['quiz_id'] as String?,
      category: json['category'] as String?,
      score: (json['score'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    final data = {
      'created_at': createdAt?.toIso8601String(),
      'quiz_id': quizId,
      'category': category,
      'score': score,
    };

    // The same issue of QuizSessionModel
    if (id != null) {
      data['id'] = id;
    }
    return data;
  }

  PerformanceBreackdownModel copyWith({
    String? id,
    DateTime? createdAt,
    String? quizId,
    String? category,
    double? score,
  }) {
    return PerformanceBreackdownModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      quizId: quizId ?? this.quizId,
      category: category ?? this.category,
      score: score ?? this.score,
    );
  }
}
