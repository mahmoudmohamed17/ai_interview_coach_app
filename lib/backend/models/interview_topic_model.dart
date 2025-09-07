import 'package:ai_interview_coach_app/core/constants/app_assets.dart';

class InterviewTopicModel {
  final String label;
  final String icon;

  InterviewTopicModel({required this.label, required this.icon});
}

final interviewTopics = [
  InterviewTopicModel(
    label: 'Flutter Development',
    icon: AppAssets.iconsFlutter,
  ),
  InterviewTopicModel(label: 'React Development', icon: AppAssets.iconsReact),
  InterviewTopicModel(label: 'Node.js Backend', icon: AppAssets.iconsNodejs),
  InterviewTopicModel(label: 'Python Development', icon: AppAssets.iconsPython),
  InterviewTopicModel(label: 'Java Development', icon: AppAssets.iconsJava),
  InterviewTopicModel(
    label: 'JavaScript Fundamentals',
    icon: AppAssets.iconsJs,
  ),
  InterviewTopicModel(
    label: 'Databases Fundamentals',
    icon: AppAssets.iconsOracle,
  ),
  InterviewTopicModel(
    label: 'Cyber Security',
    icon: AppAssets.iconsCyberSecurity,
  ),
];
