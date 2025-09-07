class InterviewDifficultyLevelModel {
  final String label;
  final String description;
  final int questionsNumber;

  InterviewDifficultyLevelModel({
    required this.label,
    required this.description,
    required this.questionsNumber,
  });
}

final difficultyLevels = [
  InterviewDifficultyLevelModel(
    label: 'Beginner',
    description: 'Basic concepts and fundamentals',
    questionsNumber: 8,
  ),
  InterviewDifficultyLevelModel(
    label: 'Intermediate',
    description: 'Practical application and problem solving',
    questionsNumber: 12,
  ),
  InterviewDifficultyLevelModel(
    label: 'Advanced',
    description: 'Complex scenarios and best practices',
    questionsNumber: 15,
  ),
];
