import 'dart:developer';
import 'package:ai_interview_coach_app/ai/config/gemini_service_config.dart';
import 'package:ai_interview_coach_app/ai/models/answer_model.dart';
import 'package:ai_interview_coach_app/ai/models/feedback_model.dart';
import 'package:ai_interview_coach_app/ai/models/question_model.dart';
import 'package:ai_interview_coach_app/ai/models/quiz_config_model.dart';
import 'package:ai_interview_coach_app/ai/utilities/clean_bot_response.dart';
import 'package:ai_interview_coach_app/core/secret/app_secret.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class GeminiService {
  final _client = Gemini.instance;

  List<Content> chat = [];

  static void init() => Gemini.init(apiKey: AppSecret.geminiApiKey);

  Future<List<QuestionModel>> getQuestions({
    required QuizConfigModel quizConfigModel,
  }) async {
    try {
      if (chat.isEmpty) {
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

      final botResponse = await _client.chat(chat);

      if (botResponse?.content != null) {
        chat.add(botResponse!.content!);
        final result = cleanBotResponse(botResponse.output!);
        final questions = (result['questions'] as List)
            .map((item) => QuestionModel.fromJson(item))
            .toList();
        return questions;
      } else {
        return [];
      }
    } catch (e) {
      log('Error: ${e.toString()}');
      return [];
    }
  }

  Future<FeedbackModel> submitAnswers({
    required List<AnswerModel> answers,
  }) async {
    try {
      log('AI Chat: $chat');

      final Map<String, dynamic> anwersJson = {
        "answers": answers.map((item) => item.toJson()).toList(),
      };

      chat.add(
        Content(parts: [Part.text(anwersJson.toString())], role: 'user'),
      );

      final botResponse = await _client.chat(chat);

      if (botResponse?.content != null) {
        chat.add(botResponse!.content!);
        return FeedbackModel.fromJson(cleanBotResponse(botResponse.output!));
      } else {
        return FeedbackModel.fromJson({});
      }
    } catch (e) {
      log('Error: ${e.toString()}');
      return FeedbackModel.fromJson({});
    }
  }

  void clearChat() {
    chat.clear();
  }
}
