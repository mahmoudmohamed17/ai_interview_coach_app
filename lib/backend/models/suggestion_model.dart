class SuggestionModel {
  final DateTime? createdAt;
  final String? quizId;
  final String? suggestion;
  final String? id;
  final String? userId;

  const SuggestionModel({
    this.createdAt,
    this.quizId,
    this.suggestion,
    this.id,
    this.userId,
  });

  @override
  String toString() {
    return 'SuggestionModel(createdAt: $createdAt, quizId: $quizId, suggestion: $suggestion, id: $id, userId: $userId)';
  }

  factory SuggestionModel.fromJson(Map<String, dynamic> json) {
    return SuggestionModel(
      createdAt: DateTime.parse(json['created_at'] as String),
      quizId: json['quiz_id'] as String?,
      suggestion: json['suggestion'] as String?,
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final data = {
      'created_at': createdAt?.toIso8601String(),
      'quiz_id': quizId,
      'suggestion': suggestion,
      'user_id': userId,
    };
    if (id != null) {
      data['id'] = id;
    }
    return data;
  }

  SuggestionModel copyWith({
    DateTime? createdAt,
    String? quizId,
    String? suggestion,
    String? id,
    String? userId,
  }) {
    return SuggestionModel(
      createdAt: createdAt ?? this.createdAt,
      quizId: quizId ?? this.quizId,
      suggestion: suggestion ?? this.suggestion,
      id: id ?? this.id,
      userId: userId ?? this.userId,
    );
  }
}
