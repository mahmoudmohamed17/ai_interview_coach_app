import 'package:ai_interview_coach_app/views/auth/init_auth_view.dart';
import 'package:go_router/go_router.dart';

class AppRouting {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const InitAuthView()),
    ],
  );
}
