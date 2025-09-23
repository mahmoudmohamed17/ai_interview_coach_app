import 'package:ai_interview_coach_app/ai/services/gemini_service.dart';

/// This model used to take the questions right from [GeminiService]
class QuestionModel {
  final int id;
  final String question;
  final List<String> choices;
  final String correctChoice;
  final String explanation;

  const QuestionModel({
    required this.id,
    required this.question,
    required this.choices,
    required this.correctChoice,
    required this.explanation,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'choices': choices,
      'correct_choice': correctChoice,
      'explanation': explanation,
    };
  }

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      question: json['question'],
      choices: List<String>.from(json['choices']),
      correctChoice: json['correct_choice'],
      explanation: json['explanation'],
    );
  }

  QuestionModel copyWith({
    int? id,
    String? question,
    List<String>? choices,
    String? correctChoice,
    String? explanation,
  }) {
    return QuestionModel(
      id: id ?? this.id,
      question: question ?? this.question,
      choices: choices ?? this.choices,
      correctChoice: correctChoice ?? this.correctChoice,
      explanation: explanation ?? this.explanation,
    );
  }

  @override
  String toString() {
    return 'QuestionModel{id: $id, question: $question, choices: $choices, correctChoice: $correctChoice, explanation: $explanation}';
  }
}
