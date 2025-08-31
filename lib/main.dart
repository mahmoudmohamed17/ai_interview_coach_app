import 'package:ai_interview_coach_app/core/di/get_it_service.dart';
import 'package:ai_interview_coach_app/core/routing/app_routing.dart';
import 'package:ai_interview_coach_app/core/utilities/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetItService.setup();
  await SharedPrefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins.toString(),
        useMaterial3: true,
      ),
      routerConfig: AppRouting.router,
    );
  }
}
