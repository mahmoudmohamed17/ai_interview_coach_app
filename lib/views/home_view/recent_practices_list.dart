import 'package:ai_interview_coach_app/backend/models/recent_practice_model.dart';
import 'package:ai_interview_coach_app/views/home_view/recent_practice_item.dart';
import 'package:flutter/material.dart';

class RecentPracticesList extends StatelessWidget {
  const RecentPracticesList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      RecentPracticeModel(
        practiceTitle: 'System Design Practice',
        questionsNumber: 15,
        score: 85.0,
      ),
      RecentPracticeModel(
        practiceTitle: 'Flutter Development Interview',
        questionsNumber: 8,
        score: 92.0,
      ),
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: items.map((item) => RecentPracticeItem(model: item)).toList(),
    );
  }
}
