import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomLoadingIndicatorDialog extends StatelessWidget {
  const CustomLoadingIndicatorDialog({
    super.key,
    required this.child,
    required this.isLoading,
  });

  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            isLoading ? Colors.black54 : Colors.transparent,
            BlendMode.srcOver,
          ),
          child: child,
        ),
        if (isLoading)
          AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
            icon: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              radius: 20,
              child: Icon(
                FontAwesomeIcons.exclamation,
                size: 20,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            title: Text(
              'Saving session data...',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [CircularProgressIndicator()],
            ),
          ),
      ],
    );
  }
}
