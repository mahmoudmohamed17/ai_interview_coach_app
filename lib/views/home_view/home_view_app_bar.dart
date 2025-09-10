import 'package:ai_interview_coach_app/core/routing/routes.dart';
import 'package:ai_interview_coach_app/core/utilities/handle_user_profile_picture.dart';
import 'package:ai_interview_coach_app/cubits/auth_cubit.dart';
import 'package:ai_interview_coach_app/cubits/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final themCubit = context.read<ThemeCubit>();
    final authCubit = context.watch<AuthCubit>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.outline,
            offset: const Offset(0, 0.5),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          const SizedBox(width: 4),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => context.push(Routes.profileView),
              customBorder: const CircleBorder(),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: CircleAvatar(
                  radius: 24,
                  backgroundImage: handleUserProfilePicture(
                    authCubit.userModel!.profilePicture,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) =>
                RotationTransition(turns: animation, child: child),
            child: IconButton(
              key: ValueKey(themCubit.state),
              onPressed: () async {
                await themCubit.changeTheme();
              },
              icon: Icon(themCubit.state ? Icons.dark_mode : Icons.light_mode),
            ),
          ),
        ],
      ),
    );
  }
}
