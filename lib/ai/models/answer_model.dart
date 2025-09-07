class AnswerModel {
  final int questionId;
  final String answer;

  AnswerModel({required this.questionId, required this.answer});

  Map<String, dynamic> toJson() {
    return {'question_id': questionId, 'answer': answer};
  }

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(
      questionId: json['question_id'] as int,
      answer: json['answer'] as String,
    );
  }

  AnswerModel copyWith({int? questionId, String? answer}) {
    return AnswerModel(
      questionId: questionId ?? this.questionId,
      answer: answer ?? this.answer,
    );
  }
}
