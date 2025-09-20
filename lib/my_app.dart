import 'package:ai_interview_coach_app/core/di/setup_locator.dart';
import 'package:ai_interview_coach_app/core/routing/app_routing.dart';
import 'package:ai_interview_coach_app/core/theme/app_theme.dart';
import 'package:ai_interview_coach_app/cubits/auth_cubit.dart';
import 'package:ai_interview_coach_app/cubits/quiz_cubit.dart';
import 'package:ai_interview_coach_app/cubits/recent_sessions_cubit.dart';
import 'package:ai_interview_coach_app/cubits/theme_cubit.dart';
import 'package:ai_interview_coach_app/cubits/user_stats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt.get<AuthCubit>()),
        BlocProvider(create: (context) => getIt.get<ThemeCubit>()),
        BlocProvider(create: (context) => getIt.get<QuizCubit>()),
        BlocProvider(create: (context) => getIt.get<RecentSessionsCubit>()),
        BlocProvider(create: (context) => getIt.get<UserStatsCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, state) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeAnimationCurve: Curves.fastOutSlowIn,
          themeAnimationDuration: const Duration(milliseconds: 1500),
          themeMode: state ? ThemeMode.dark : ThemeMode.light,
          routerConfig: AppRouting.router,
        ),
      ),
    );
  }
}
