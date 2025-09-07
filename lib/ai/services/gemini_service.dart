import 'dart:convert';
import 'dart:developer';
import 'package:ai_interview_coach_app/ai/config/service_config.dart';
import 'package:ai_interview_coach_app/ai/models/answer_model.dart';
import 'package:ai_interview_coach_app/ai/models/feedback_model.dart';
import 'package:ai_interview_coach_app/ai/models/question_model.dart';
import 'package:ai_interview_coach_app/core/secret/app_secret.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class GeminiService {
  final _client = Gemini.instance;

  final List<Content> chat = [];

  static void init() => Gemini.init(apiKey: AppSecret.geminiApiKey);

  Future<List<QuestionModel>> getQuestions({
    required String topic,
    required int questionsCount,
  }) async {
    try {
      if (chat.isEmpty) {
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
      final botResponse = await _client.chat(chat);
      if (botResponse?.content != null) {
        chat.add(botResponse!.content!);
        final cleanResponse = botResponse.output!
            .replaceAll(RegExp(r"```[a-zA-Z]*"), "")
            .trim();
        final Map<String, dynamic> result = jsonDecode(cleanResponse);
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
      final Map<String, dynamic> anwersJson = {
        "answers": answers.map((item) => item.toJson()).toList(),
      };
      final botResponse = await _client.chat([
        Content(parts: [Part.text(anwersJson.toString())], role: 'user'),
      ]);
      if (botResponse?.content != null) {
        chat.add(botResponse!.content!);
        final Map<String, dynamic> result = jsonDecode(botResponse.output!);
        return FeedbackModel.fromJson(result);
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
