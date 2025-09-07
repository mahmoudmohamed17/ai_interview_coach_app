import 'package:ai_interview_coach_app/ai/services/gemini_service.dart';
import 'package:ai_interview_coach_app/core/di/setup_locator.dart';
import 'package:ai_interview_coach_app/core/utilities/custom_bloc_oberver.dart';
import 'package:ai_interview_coach_app/core/utilities/init_supabase.dart';
import 'package:ai_interview_coach_app/core/utilities/shared_prefs.dart';
import 'package:ai_interview_coach_app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  Bloc.observer = CustomBlocOberver();
  GeminiService.init();
  await initSupabase();
  await SharedPrefs.init();
  runApp(const MyApp());
}
