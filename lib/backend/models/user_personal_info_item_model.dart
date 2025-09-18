import 'package:flutter/widgets.dart';
import 'package:ai_interview_coach_app/views/profile_view/user_personal_info_widget.dart';

/// Used for the user personal data card @[UserPersonalInfoWidget]
class UserPersonalInfoItemModel {
  final String label;
  final String value;
  final IconData icon;

  const UserPersonalInfoItemModel({
    required this.label,
    required this.value,
    required this.icon,
  });
}
