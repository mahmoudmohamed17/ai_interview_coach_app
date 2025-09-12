import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditProfileViewAppBar extends StatelessWidget {
  const EditProfileViewAppBar({super.key});

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
          const Spacer(),
          Text(
            'Edit Profile',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          Opacity(
            opacity: 0,
            child: IconButton(
              onPressed: () => context.pop(),
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
