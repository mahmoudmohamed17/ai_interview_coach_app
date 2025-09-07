class QuestionModel {
  final int id;
  final String question;
  final List<String> choices;
  final String correctChoice;

  QuestionModel({
    required this.id,
    required this.question,
    required this.choices,
    required this.correctChoice,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'choices': choices,
      'correct_choice': correctChoice,
    };
  }

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      question: json['question'],
      choices: List<String>.from(json['choices']),
      correctChoice: json['correct_choice'],
    );
  }

  QuestionModel copyWith({
    int? id,
    String? question,
    List<String>? choices,
    String? correctChoice,
  }) {
    return QuestionModel(
      id: id ?? this.id,
      question: question ?? this.question,
      choices: choices ?? this.choices,
      correctChoice: correctChoice ?? this.correctChoice,
    );
  }
}
