/// This class to help collecting the quiz info/config,
/// so that we can send it easily to the Gemini service
class QuizConfigModel {
  final String topic;
  final int questionsCount;
  final String difficultyLevel;

  const QuizConfigModel({
    required this.topic,
    required this.questionsCount,
    required this.difficultyLevel,
  });
}
