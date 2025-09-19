import 'package:ai_interview_coach_app/ai/config/gemini_service_config.dart';
import 'package:ai_interview_coach_app/ai/models/quiz_config_model.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

Future<void> updateBotChat({
  required List<Content> chat,
  required QuizConfigModel quizConfigModel,
}) async {
  final systemPrompt = await GeminiServiceConfig.systemPrompt(
    topic: quizConfigModel.topic,
    questionsCount: quizConfigModel.questionsCount,
    difficultyLevel: quizConfigModel.difficultyLevel,
  );
  chat.addAll([
    Content(parts: [Part.text(systemPrompt)], role: 'user'),
    Content(
      parts: [Part.text(GeminiServiceConfig.modelPredefinedAnswer)],
      role: 'model',
    ),
  ]);
}
