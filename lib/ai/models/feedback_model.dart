class FeedbackModel {
  final double score;
  final String overview;
  final double technicalKnowledge;
  final double problemSolving;
  final double bestPractices;
  final List<String> suggestionsForImprovement;

  const FeedbackModel({
    required this.score,
    required this.overview,
    required this.technicalKnowledge,
    required this.problemSolving,
    required this.bestPractices,
    required this.suggestionsForImprovement,
  });

  Map<String, dynamic> toJson() {
    return {
      'score': score,
      'overview': overview,
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
    double? technicalKnowledge,
    double? problemSolving,
    double? bestPractices,
    List<String>? suggestionsForImprovement,
  }) {
    return FeedbackModel(
      score: score ?? this.score,
      overview: overview ?? this.overview,
      technicalKnowledge: technicalKnowledge ?? this.technicalKnowledge,
      problemSolving: problemSolving ?? this.problemSolving,
      bestPractices: bestPractices ?? this.bestPractices,
      suggestionsForImprovement:
          suggestionsForImprovement ?? this.suggestionsForImprovement,
    );
  }
}
