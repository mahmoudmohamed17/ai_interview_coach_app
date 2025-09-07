import 'package:ai_interview_coach_app/ai/config/service_config.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

void updateBotChat({
  required List<Content> chat,
  required String topic,
  required int questionsCount,
}) {
  chat.addAll([
    Content(
      parts: [
        Part.text(
          ServiceConfig.systemPrompt(
            topic: topic,
            questionsCount: questionsCount,
          ),
        ),
      ],
      role: 'user',
    ),
    Content(
      parts: [Part.text(ServiceConfig.modelPredefinedAnswer)],
      role: 'model',
    ),
  ]);
}
