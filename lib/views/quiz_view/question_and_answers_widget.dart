import 'dart:developer';

import 'package:ai_interview_coach_app/views/quiz_view/answers_item_widget.dart';
import 'package:ai_interview_coach_app/views/quiz_view/question_item_widget.dart';
import 'package:flutter/material.dart';

class QuestionAndAnswersWidget extends StatelessWidget {
  const QuestionAndAnswersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        QuestionItemWidget(),
        AnswersItemWidget(
          onSelected: (answer) {
            log(answer);
          },
        ),
      ],
    );
  }
}
