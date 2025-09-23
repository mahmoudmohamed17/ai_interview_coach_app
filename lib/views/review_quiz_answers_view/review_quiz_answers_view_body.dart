import 'package:ai_interview_coach_app/ai/models/answer_model.dart';
import 'package:ai_interview_coach_app/ai/models/question_model.dart';
import 'package:ai_interview_coach_app/views/quiz_view/quiz_progress_indicator_widget.dart';
import 'package:ai_interview_coach_app/views/review_quiz_answers_view/questions_navigation_buttons_widget.dart';
import 'package:ai_interview_coach_app/views/review_quiz_answers_view/review_quiz_answers_app_bar.dart';
import 'package:ai_interview_coach_app/views/review_quiz_answers_view/solved_question_with_answers.dart';
import 'package:flutter/widgets.dart';

class ReviewQuizAnswersViewBody extends StatefulWidget {
  const ReviewQuizAnswersViewBody({super.key});

  /// Only need to give this widget the current questions and answers :)

  @override
  State<ReviewQuizAnswersViewBody> createState() =>
      _ReviewQuizAnswersViewBodyState();
}

class _ReviewQuizAnswersViewBodyState extends State<ReviewQuizAnswersViewBody> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      if (_pageController.hasClients && _pageController.page != null) {
        final newIndex = _pageController.page!.round();
        if (newIndex != _currentIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const ReviewQuizAnswersAppBar(),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: QuizProgressIndicatorWidget(
            questionCount: dummyQuestions.length,
            currentIndex: _currentIndex,
          ),
        ),
        const SizedBox(height: 32),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: PageView.builder(
              controller: _pageController,
              itemCount: dummyQuestions.length,
              itemBuilder: (context, index) => SolvedQuestionWithAnswers(
                questionModel: dummyQuestions[index],
                answerModel: dummyAnswers[index],
                remainingQuestions: dummyQuestions.length - index - 1,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: QuestionsNavigationButtonsWidget(
            pageController: _pageController,
            currentIndex: _currentIndex,
            totalQuestions: dummyQuestions.length,
          ),
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}
