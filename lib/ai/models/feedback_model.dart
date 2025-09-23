class FeedbackModel {
  final double score;
  final String overview;
  final int correctAnswers;
  final int wrongAnswers;
  final double technicalKnowledge;
  final double problemSolving;
  final double bestPractices;
  final List<String> suggestionsForImprovement;

  const FeedbackModel({
    required this.score,
    required this.overview,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.technicalKnowledge,
    required this.problemSolving,
    required this.bestPractices,
    required this.suggestionsForImprovement,
  });

  Map<String, dynamic> toJson() {
    return {
      'score': score,
      'overview': overview,
      'correct_answers': correctAnswers,
      'wrong_answers': wrongAnswers,
      'technical_knowledge': technicalKnowledge,
      'problem_solving': problemSolving,
      'best_practices': bestPractices,
      'suggestions_for_improvement': suggestionsForImprovement,
    };
  }

  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return FeedbackModel(
      score: json['results']['score']?.toDouble() ?? 0.0,
      overview: json['results']['overview'] ?? '',
      correctAnswers: json['results']['correct_answers'] ?? 0,
      wrongAnswers: json['results']['wrong_answers'] ?? 0,
      technicalKnowledge:
          json['performance_breakdown']['technical_knowledge']?.toDouble() ??
          0.0,
      problemSolving:
          json['performance_breakdown']['problem_solving']?.toDouble() ?? 0.0,
      bestPractices:
          json['performance_breakdown']['best_practices']?.toDouble() ?? 0.0,
      suggestionsForImprovement: List<String>.from(
        json['suggestions_for_improvement'] ?? [],
      ),
    );
  }

  FeedbackModel copyWith({
    double? score,
    String? overview,
    int? correctAnswers,
    int? wrongAnswers,
    double? technicalKnowledge,
    double? problemSolving,
    double? bestPractices,
    List<String>? suggestionsForImprovement,
  }) {
    return FeedbackModel(
      score: score ?? this.score,
      overview: overview ?? this.overview,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      wrongAnswers: wrongAnswers ?? this.wrongAnswers,
      technicalKnowledge: technicalKnowledge ?? this.technicalKnowledge,
      problemSolving: problemSolving ?? this.problemSolving,
      bestPractices: bestPractices ?? this.bestPractices,
      suggestionsForImprovement:
          suggestionsForImprovement ?? this.suggestionsForImprovement,
    );
  }
}
