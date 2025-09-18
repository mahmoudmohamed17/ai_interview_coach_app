import 'package:ai_interview_coach_app/views/quiz_view/choose_difficulty_level_widget.dart';

/// Used to set up the topic difficulty level
/// Model used @[ChooseDifficultyLevelWidget]
class InterviewDifficultyLevelModel {
  final String label;
  final String description;
  final int questionsNumber;

  const InterviewDifficultyLevelModel({
    required this.label,
    required this.description,
    required this.questionsNumber,
  });
}
