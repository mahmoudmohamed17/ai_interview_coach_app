class SuggestionModel {
  String? createdAt;
  String? quizId;
  String? suggestion;
  String? id;

  SuggestionModel({this.createdAt, this.quizId, this.suggestion, this.id});

  @override
  String toString() {
    return 'SuggestionModel(createdAt: $createdAt, quizId: $quizId, suggestion: $suggestion, id: $id)';
  }

  factory SuggestionModel.fromJson(Map<String, dynamic> json) {
    return SuggestionModel(
      createdAt: json['created_at'] as String?,
      quizId: json['quiz_id'] as String?,
      suggestion: json['suggestion'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'created_at': createdAt,
    'quiz_id': quizId,
    'suggestion': suggestion,
    'id': id,
  };

  SuggestionModel copyWith({
    String? createdAt,
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
