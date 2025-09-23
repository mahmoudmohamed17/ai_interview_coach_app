import 'package:ai_interview_coach_app/ai/models/feedback_model.dart';
import 'package:ai_interview_coach_app/ai/models/question_model.dart';
import 'package:ai_interview_coach_app/backend/models/quiz_session_model.dart';
import 'package:ai_interview_coach_app/backend/models/user_data_model.dart';
import 'package:ai_interview_coach_app/core/constants/app_constants.dart';
import 'package:ai_interview_coach_app/core/routing/routes.dart';
import 'package:ai_interview_coach_app/core/utilities/shared_prefs.dart';
import 'package:ai_interview_coach_app/views/auth_view/init_auth_view.dart';
import 'package:ai_interview_coach_app/views/auth_view/login_view.dart';
import 'package:ai_interview_coach_app/views/auth_view/signup_view.dart';
import 'package:ai_interview_coach_app/views/home_view/home_view.dart';
import 'package:ai_interview_coach_app/views/profile_view/edit_profile_view.dart';
import 'package:ai_interview_coach_app/views/profile_view/profile_view.dart';
import 'package:ai_interview_coach_app/views/quiz_view/interview_results_view.dart';
import 'package:ai_interview_coach_app/views/quiz_view/interview_setup_view.dart';
import 'package:ai_interview_coach_app/views/quiz_view/quiz_view.dart';
import 'package:ai_interview_coach_app/views/recent_practice_sessions_view/recent_practice_sessions_view.dart';
import 'package:ai_interview_coach_app/views/recent_session_details_view/recent_session_details_view.dart';
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
      GoRoute(
        path: Routes.profileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: Routes.editProfileView,
        builder: (context, state) {
          final userModel = state.extra as UserDataModel;
          return EditProfileView(userModel: userModel);
        },
      ),
      GoRoute(
        path: Routes.interviewSetupView,
        builder: (context, state) => const InterviewSetupView(),
      ),
      GoRoute(
        path: Routes.quizView,
        builder: (context, state) {
          final questions = state.extra as List<QuestionModel>;
          return QuizView(questions: questions);
        },
      ),
      GoRoute(
        path: Routes.interviewResultsView,
        builder: (context, state) {
          final feedback = state.extra as FeedbackModel;
          return InterviewResultsView(feedback: feedback);
        },
      ),
      GoRoute(
        path: Routes.recentPracticeSessionsView,
        builder: (context, state) {
          final sessions = state.extra as List<QuizSessionModel>;
          return RecentPracticeSessionsView(sessions: sessions);
        },
      ),
      GoRoute(
        path: Routes.recentSessionDetailsView,
        builder: (context, state) {
          final model = state.extra as QuizSessionModel;
          return RecentSessionDetailsView(model: model);
        },
      ),
    ],
  );
}
