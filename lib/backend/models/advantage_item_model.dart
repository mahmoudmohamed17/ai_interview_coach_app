import 'package:flutter/widgets.dart';
import 'package:ai_interview_coach_app/views/home_view/advantages_section.dart';

/// Used for the advantages section @[AdvantagesSection]
class AdvantageItemModel {
  final String text;
  final String subText;
  final IconData icon;
  final Color iconColor;
  final Color iconbackgrnColor;

  const AdvantageItemModel({
    required this.text,
    required this.subText,
    required this.icon,
    required this.iconColor,
    required this.iconbackgrnColor,
  });
}
