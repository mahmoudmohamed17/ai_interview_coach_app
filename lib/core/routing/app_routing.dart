import 'package:ai_interview_coach_app/core/constants/app_constants.dart';
import 'package:ai_interview_coach_app/core/routing/routes.dart';
import 'package:ai_interview_coach_app/core/utilities/shared_prefs.dart';
import 'package:ai_interview_coach_app/views/auth_view/init_auth_view.dart';
import 'package:ai_interview_coach_app/views/auth_view/login_view.dart';
import 'package:ai_interview_coach_app/views/auth_view/signup_view.dart';
import 'package:ai_interview_coach_app/views/home_view/home_view.dart';
import 'package:go_router/go_router.dart';

class AppRouting {
  static final router = GoRouter(
    initialLocation: SharedPrefs.getBool(isUserAuthenticated)
        ? Routes.homeView
        : '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const InitAuthView()),
      GoRoute(
        path: Routes.loginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: Routes.signupView,
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        path: Routes.homeView,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
