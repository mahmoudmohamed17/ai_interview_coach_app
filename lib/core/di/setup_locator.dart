import 'package:ai_interview_coach_app/backend/services/supabase_auth_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<SupabaseAuthService>(() => SupabaseAuthService());
}
