import 'package:flutter/services.dart' show rootBundle;

class AIServiceConfig {
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
}
