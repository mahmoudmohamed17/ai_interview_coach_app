import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottonNavBar extends StatelessWidget {
  const CustomBottonNavBar({
    super.key,
    required this.onSelected,
    required this.currentIndex,
  });
  final void Function(int) onSelected;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: AppColors.borderColor, offset: Offset(0, -1)),
        ],
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => onSelected.call(0),
            icon: Icon(
              FontAwesomeIcons.house,
              color: currentIndex == 0
                  ? AppColors.primaryColor
                  : AppColors.secondaryColor,
              size: currentIndex == 0 ? 28 : 24,
            ),
          ),
          IconButton(
            onPressed: () => onSelected.call(1),
            icon: Icon(
              FontAwesomeIcons.clock,
              color: currentIndex == 1
                  ? AppColors.primaryColor
                  : AppColors.secondaryColor,
              size: currentIndex == 1 ? 28 : 24,
            ),
          ),
          IconButton(
            onPressed: () => onSelected.call(2),
            icon: Icon(
              FontAwesomeIcons.user,
              color: currentIndex == 2
                  ? AppColors.primaryColor
                  : AppColors.secondaryColor,
              size: currentIndex == 2 ? 28 : 24,
            ),
          ),
        ],
      ),
    );
  }
}
