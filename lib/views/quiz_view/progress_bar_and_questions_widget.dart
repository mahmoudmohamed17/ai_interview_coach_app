import 'package:ai_interview_coach_app/ai/models/question_model.dart';
import 'package:ai_interview_coach_app/views/quiz_view/question_and_answers_widget.dart';
import 'package:ai_interview_coach_app/views/quiz_view/quiz_navigation_buttons.dart';
import 'package:ai_interview_coach_app/views/quiz_view/quiz_progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class ProgressBarAndQuestionsWidget extends StatefulWidget {
  const ProgressBarAndQuestionsWidget({super.key, required this.questions});
  final List<QuestionModel> questions;

  @override
  State<ProgressBarAndQuestionsWidget> createState() =>
      _ProgressBarAndQuestionsWidgetState();
}

class _ProgressBarAndQuestionsWidgetState
    extends State<ProgressBarAndQuestionsWidget> {
  late PageController _pageController;
  int _currentIndex = 0;
  final Map<int, String> _selectedAnswers = {};

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

  void _onAnswerSelected(int questionIndex, String answer) {
    setState(() {
      _selectedAnswers[questionIndex] = answer;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          QuizProgressIndicatorWidget(
            questionCount: widget.questions.length,
            currentIndex: _currentIndex,
          ),
          const SizedBox(height: 32),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.questions.length,
              itemBuilder: (context, index) => QuestionAndAnswersWidget(
                questionModel: widget.questions[index],
                remainingQuestions: widget.questions.length - (index + 1),
                selectedAnswer: _selectedAnswers[index],
                onAnswerSelected: (answer) => _onAnswerSelected(index, answer),
              ),
            ),
          ),
          const SizedBox(height: 32),
          QuizNavigationButtons(
            pageController: _pageController,
            currentIndex: _currentIndex,
            selectedAnswers: _selectedAnswers,
            totalQuestions: widget.questions.length,
          ),
          const SizedBox(height: 48),
        ],
      ),
    );
  }
}
