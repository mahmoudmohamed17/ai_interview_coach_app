import 'package:ai_interview_coach_app/ai/config/ai_service_config.dart';
import 'package:ai_interview_coach_app/ai/error/failure.dart';
import 'package:ai_interview_coach_app/ai/models/answer_model.dart';
import 'package:ai_interview_coach_app/ai/models/content_model/content_model.dart';
import 'package:ai_interview_coach_app/ai/models/content_model/part.dart';
import 'package:ai_interview_coach_app/ai/models/feedback_model.dart';
import 'package:ai_interview_coach_app/ai/models/question_model.dart';
import 'package:ai_interview_coach_app/ai/models/quiz_config_model.dart';
import 'package:ai_interview_coach_app/ai/utilities/clean_bot_response.dart';
import 'package:ai_interview_coach_app/backend/services/dio_service.dart';
import 'package:ai_interview_coach_app/core/secret/app_secret.dart';
import 'package:dartz/dartz.dart';

class GeminiService {
  GeminiService(this.dioService);

  final DioService dioService;

  List<ContentModel> chat = [];

  Future<Either<List<QuestionModel>, Failure>> getQuestions({
    required QuizConfigModel quizConfigModel,
  }) async {
    try {
      final systemPrompt = await AIServiceConfig.systemPrompt(
        topic: quizConfigModel.topic,
        questionsCount: quizConfigModel.questionsCount,
        difficultyLevel: quizConfigModel.difficultyLevel,
      );

      chat.add(
        ContentModel(
          parts: [Part(text: systemPrompt)],
          role: 'user',
        ),
      );

      final data =
          (await dioService.post(
                AppSecret.geminiApiUrl,
                data: {"contents": chat.toString()},
                headers: {"X-goog-api-key": AppSecret.geminiApiKey},
              ))
              as Map<String, dynamic>;

      final result = extractReponseData(data);

      final questions = (result['questions'] as List)
          .map((item) => QuestionModel.fromJson(item))
          .toList();

      return left(questions);
    } catch (e) {
      return right(Failure(message: e.toString()));
    }
  }

  Future<Either<FeedbackModel, Failure>> submitAnswers({
    required List<AnswerModel> answers,
  }) async {
    try {
      final Map<String, dynamic> anwersJson = {
        "answers": answers.map((item) => item.toJson()).toList(),
      };

      chat.add(
        ContentModel(
          parts: [Part(text: anwersJson.toString())],
          role: 'user',
        ),
      );

      final data =
          (await dioService.post(
                AppSecret.geminiApiUrl,
                data: {"contents": chat.toString()},
                headers: {"X-goog-api-key": AppSecret.geminiApiKey},
              ))
              as Map<String, dynamic>;

      final result = extractReponseData(data);

      return left(FeedbackModel.fromJson(result));
    } catch (e) {
      return right(Failure(message: e.toString()));
    }
  }

  Map<String, dynamic> extractReponseData(Map<String, dynamic> data) {
    final response = data['candidates'][0]['content'] as Map<String, dynamic>;

    final botResponse = ContentModel.fromMap(response);

    chat.add(botResponse);

    final result = cleanBotResponse(botResponse.parts![0].text!);
    return result;
  }

  void clearChat() {
    chat.clear();
  }
}
