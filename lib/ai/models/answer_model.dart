import 'package:ai_interview_coach_app/ai/services/gemini_service.dart';


/// This class used to get the current question answer and pass it to the [GeminiService]
/// We use an enum class to make it easy to specify which question is answered or skipped

enum AnswerStatus { answered, skipped }

class AnswerModel {
  final int questionId;
  final String? answer;
  final AnswerStatus status;

  const AnswerModel({
    required this.questionId,
    this.answer,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {'question_id': questionId, 'answer': answer, 'status': status.name};
  }

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(
      questionId: json['question_id'] as int,
      answer: json['answer'] as String?,
      status: AnswerStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => AnswerStatus.skipped,
      ),
    );
  }

  AnswerModel copyWith({
    int? questionId,
    String? answer,
    AnswerStatus? status,
  }) {
    return AnswerModel(
      questionId: questionId ?? this.questionId,
      answer: answer ?? this.answer,
      status: status ?? this.status,
    );
  }
}
