import 'package:ai_interview_coach_app/ai/services/gemini_service.dart';
import 'package:ai_interview_coach_app/backend/services/supabase_auth_service.dart';
import 'package:ai_interview_coach_app/backend/services/supabase_database_service.dart';
import 'package:ai_interview_coach_app/cubits/auth_cubit.dart';
import 'package:ai_interview_coach_app/cubits/recent_sessions_cubit.dart';
import 'package:ai_interview_coach_app/cubits/quiz_cubit.dart';
import 'package:ai_interview_coach_app/cubits/theme_cubit.dart';
import 'package:ai_interview_coach_app/cubits/timer_cubit.dart';
import 'package:ai_interview_coach_app/cubits/user_stats_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Services
  getIt.registerLazySingleton<SupabaseAuthService>(() => SupabaseAuthService());
  getIt.registerLazySingleton<SupabaseDatabaseService>(
    () => SupabaseDatabaseService(),
  );
  getIt.registerLazySingleton<GeminiService>(() => GeminiService());

  // Cubits
  getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(getIt()));
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
  getIt.registerLazySingleton<RecentSessionsCubit>(
    () => RecentSessionsCubit(getIt(), getIt()),
  );
  getIt.registerLazySingleton<UserStatsCubit>(
    () => UserStatsCubit(getIt(), getIt()),
  );
  getIt.registerLazySingleton<QuizCubit>(() => QuizCubit(getIt()));
  getIt.registerLazySingleton<TimerCubit>(() => TimerCubit());
}
