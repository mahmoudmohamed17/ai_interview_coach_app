import 'package:ai_interview_coach_app/backend/services/supabase_auth_service.dart';
import 'package:ai_interview_coach_app/cubits/auth_cubit.dart';
import 'package:ai_interview_coach_app/cubits/theme_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Services
  getIt.registerLazySingleton<SupabaseAuthService>(() => SupabaseAuthService());

  // Cubits
  getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(getIt()));
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
}
