import 'package:ai_interview_coach_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor)
        .copyWith(
          primary: AppColors.primaryColor, // Primary color
          onPrimary: Colors.white,
          onPrimaryFixedVariant: AppColors.primaryColor, // For special buttons
          secondary: AppColors.secondaryColor, // Helper color
          onSecondary: Colors.black,
          surface: Colors.white, // Scaffold color
          onSurface: AppColors.primaryColor,
          outline: AppColors.borderColor, // Border color
          primaryContainer: Colors.white,
          onPrimaryContainer: AppColors.primaryColor,
          secondaryContainer: AppColors.primaryColor,
          onSecondaryContainer: Colors.white,
          tertiaryContainer: const Color(0xffECEEF2), // Labels/Badges color
          onTertiaryContainer: Colors.black,
          surfaceContainer: const Color(0xffF3F6FF), // Custom containers color
          surfaceBright: const Color(0xffF0FDF4), // Special for the interview results page
          surfaceContainerHigh: const Color(
            0xffF3F3F5,
          ), // Custom text fields color
        ),
    textTheme: GoogleFonts.poppinsTextTheme(),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue.shade50,
      foregroundColor: Colors.black,
      elevation: 0,
    ),
    iconTheme: const IconThemeData(color: AppColors.primaryColor),
    scaffoldBackgroundColor: Colors.white,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme:
        ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          brightness: Brightness.dark,
        ).copyWith(
          primary: Colors.white,
          onPrimary: Colors.black,
          onPrimaryFixedVariant: AppColors.primaryColor,
          secondary: AppColors.secondaryColor,
          onSecondary: Colors.black,
          surface: Colors.black,
          onSurface: Colors.white,
          outline: AppColors.borderColor,
          primaryContainer: const Color(0xff121212),
          onPrimaryContainer: Colors.white,
          secondaryContainer: Colors.white,
          onSecondaryContainer: AppColors.primaryColor,
          tertiaryContainer: const Color(0xff262626),
          onTertiaryContainer: Colors.white,
          surfaceContainer: const Color(0xff100E1B),
          surfaceBright: const Color(0xff08110D),
          surfaceContainerHigh: const Color(0xff121212),
        ),
    textTheme: GoogleFonts.poppinsTextTheme(
      ThemeData(brightness: Brightness.dark).textTheme,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blueGrey.shade900,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: Colors.black,
  );
}
