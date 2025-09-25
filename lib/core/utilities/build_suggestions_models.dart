import 'package:ai_interview_coach_app/backend/models/suggestion_model.dart';

List<SuggestionModel> buildSuggestionsModels({
  required List<String> list,
  required String quizId,
  required String userId,
}) {
  return list
      .map(
        (item) => SuggestionModel(
          quizId: quizId,
          suggestion: item,
          createdAt: DateTime.now(),
          userId: userId,
        ),
      )
      .toList();
}
