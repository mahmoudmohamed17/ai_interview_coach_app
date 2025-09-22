import 'package:ai_interview_coach_app/backend/models/suggestion_model.dart';

List<SuggestionModel> buildSuggestionsModels({
  required List<String> list,
  required String quizId,
}) {
  return list
      .map(
        (item) => SuggestionModel(
          quizId: quizId,
          suggestion: item,
          createdAt: DateTime.now(),
        ),
      )
      .toList();
}
