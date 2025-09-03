import 'dart:ui';

import 'package:ai_interview_coach_app/core/theme/app_colors.dart';

Color generateColor(double degree) {
  if (degree >= 90.0) {
    return AppColors.blueIconColor;
  } else if (degree >= 75 && degree < 90) {
    return AppColors.greenIconColor;
  } else if (degree < 75 && degree >= 60) {
    return AppColors.orangeIconColor;
  } else {
    return AppColors.purpleTextColor;
  }
}
