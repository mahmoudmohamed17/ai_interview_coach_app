import 'package:ai_interview_coach_app/cubits/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ThemeCubit>();

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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              customBorder: const CircleBorder(),
              child: const Padding(
                padding: EdgeInsets.all(2.0),
                child: CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/user_picture.png'),
                ),
              ),
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) =>
                RotationTransition(turns: animation, child: child),
            child: IconButton(
              key: ValueKey(cubit.state),
              onPressed: () async {
                await cubit.changeTheme();
              },
              icon: Icon(cubit.state ? Icons.dark_mode : Icons.light_mode),
            ),
          ),
        ],
      ),
    );
  }
}
