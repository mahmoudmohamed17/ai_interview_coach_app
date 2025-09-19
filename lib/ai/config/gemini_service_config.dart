import 'package:flutter/services.dart' show rootBundle;

class GeminiServiceConfig {
  static Future<String> systemPrompt({
    required String topic,
    required int questionsCount,
    required String difficultyLevel,
  }) async {
    final rawData = await rootBundle.loadString(
      'assets/prompts/system_prompt.txt',
    );
    return rawData
        .replaceAll('{topic}', topic)
        .replaceAll('{questionsCount}', questionsCount.toString())
        .replaceAll('{difficultyLevel}', difficultyLevel);
  }

  static final modelPredefinedAnswer =
      'I understand. I am ready to conduct your Flutter interview.';
}
