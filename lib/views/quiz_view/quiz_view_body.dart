import 'dart:developer';
import 'package:ai_interview_coach_app/ai/models/question_model.dart';
import 'package:ai_interview_coach_app/core/utilities/context_extension.dart';
import 'package:ai_interview_coach_app/views/quiz_view/question_and_answers_widget.dart';
import 'package:ai_interview_coach_app/views/quiz_view/quiz_navigation_buttons.dart';
import 'package:ai_interview_coach_app/views/quiz_view/quiz_progress_indicator_widget.dart';
import 'package:ai_interview_coach_app/views/quiz_view/quiz_view_app_bar.dart';
import 'package:flutter/material.dart';

class QuizViewBody extends StatefulWidget {
  const QuizViewBody({super.key});

  @override
  State<QuizViewBody> createState() => _QuizViewBodyState();
}

class _QuizViewBodyState extends State<QuizViewBody> {
  late PageController _pageController;
  double _barPercentage = 0.0;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    _updateProgress(0);

    _pageController.addListener(() {
      if (_pageController.hasClients && _pageController.page != null) {
        final newIndex = _pageController.page!.round();
        if (newIndex != _currentIndex) {
          setState(() {
            _currentIndex = newIndex;
            _updateProgress(_currentIndex);
          });
        }
      }
    });
  }

  void _updateProgress(int questionIndex) {
    _barPercentage = (questionIndex + 1) / dummyQuestions.length;
    _barPercentage = _barPercentage.clamp(0.0, 1.0);
    log('Current index: $_currentIndex');
    log('Bar percentage: $_barPercentage');
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const QuizViewAppBar(),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: QuizProgressIndicatorWidget(barPercentage: _barPercentage),
        ),
        const SizedBox(height: 32),
        SizedBox(
          height: context.height * 0.54,
          child: PageView.builder(
            controller: _pageController,
            itemCount: dummyQuestions.length,
            itemBuilder: (context, index) => const QuestionAndAnswersWidget(),
          ),
        ),
        const SizedBox(height: 24),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: QuizNavigationButtons(),
        ),
      ],
    );
  }
}
