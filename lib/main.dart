import 'package:ai_interview_coach_app/core/di/setup_locator.dart';
import 'package:ai_interview_coach_app/core/utilities/init_supabase.dart';
import 'package:ai_interview_coach_app/core/utilities/shared_prefs.dart';
import 'package:ai_interview_coach_app/my_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await initSupabase();
  await SharedPrefs.init();
  runApp(const MyApp());
}
