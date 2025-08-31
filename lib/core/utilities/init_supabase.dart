import 'package:ai_interview_coach_app/core/secret/app_secret.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> initSupabase() async {
  await Supabase.initialize(
    url: AppSecret.projectUrl,
    anonKey: AppSecret.apiAnonKey,
  );
}
