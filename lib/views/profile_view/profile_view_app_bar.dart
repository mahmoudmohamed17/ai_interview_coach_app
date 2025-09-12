import 'package:ai_interview_coach_app/backend/models/user_data_model.dart';
import 'package:ai_interview_coach_app/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ProfileViewAppBar extends StatelessWidget {
  const ProfileViewAppBar({super.key, required this.userModel});
  final UserDataModel userModel;

  @override
  Widget build(BuildContext context) {
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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Row(
        children: [
          IconButton(
            onPressed: () => context.pop(),
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.arrow_back),
          ),
          const SizedBox(width: 8),
          Text(
            'Profile',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          ElevatedButton.icon(
            onPressed: () =>
                context.push(Routes.editProfileView, extra: userModel),
            style: ElevatedButton.styleFrom(
              visualDensity: const VisualDensity(
                vertical: VisualDensity.minimumDensity,
                horizontal: VisualDensity.minimumDensity,
              ),
              padding: const EdgeInsets.all(8.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
              shadowColor: Colors.transparent,
            ),
            label: Text(
              'Edit Profile',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            icon: const Icon(FontAwesomeIcons.pen, size: 12),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
