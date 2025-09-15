import 'dart:ui';
import 'package:ai_interview_coach_app/core/theme/app_colors.dart';

Color generateColor(double score) {
  if (score >= 90.0) {
    return AppColors.blueIconColor;
  } else if (score >= 75 && score < 90) {
    return AppColors.greenIconColor;
  } else if (score < 75 && score >= 60) {
    return AppColors.orangeIconColor;
  } else {
    return AppColors.purpleTextColor;
  }
}
