import 'package:ai_interview_coach_app/backend/services/supabase_service.dart';
import 'package:get_it/get_it.dart';

class GetItService {
  static final getIt = GetIt.instance;
  static void setup() {
    getIt.registerLazySingleton<SupabaseService>(() => SupabaseService());
  }
}
