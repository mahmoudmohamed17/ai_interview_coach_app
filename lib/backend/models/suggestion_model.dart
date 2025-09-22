class SuggestionModel {
  final DateTime? createdAt;
  final String? quizId;
  final String? suggestion;
  final String? id;

  const SuggestionModel({
    this.createdAt,
    this.quizId,
    this.suggestion,
    this.id,
  });

  @override
  String toString() {
    return 'SuggestionModel(createdAt: $createdAt, quizId: $quizId, suggestion: $suggestion, id: $id)';
  }

  factory SuggestionModel.fromJson(Map<String, dynamic> json) {
    return SuggestionModel(
      createdAt: DateTime.parse(json['created_at'] as String),
      quizId: json['quiz_id'] as String?,
      suggestion: json['suggestion'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final data = {
      'created_at': createdAt?.toIso8601String(),
      'quiz_id': quizId,
      'suggestion': suggestion,
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
  }) {
    return SuggestionModel(
      createdAt: createdAt ?? this.createdAt,
      quizId: quizId ?? this.quizId,
      suggestion: suggestion ?? this.suggestion,
      id: id ?? this.id,
    );
  }
}
