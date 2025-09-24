import 'dart:math';
import 'package:ai_interview_coach_app/core/routing/routes.dart';
import 'package:ai_interview_coach_app/views/quiz_view/floating_button_dialog_clipper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ReviewQuizFloatingButton extends StatefulWidget {
  const ReviewQuizFloatingButton({super.key});

  @override
  State<ReviewQuizFloatingButton> createState() =>
      _ReviewQuizFloatingButtonState();
}

class _ReviewQuizFloatingButtonState extends State<ReviewQuizFloatingButton>
    with TickerProviderStateMixin {
  Offset position = const Offset(40, 200);

  late AnimationController _controller;
  late Animation<Offset> _bounceAnimation;
  late Animation<double> _fadeAnimation;

  // Tooltip controller
  late AnimationController _tooltipController;
  late Animation<double> _tooltipFade;

  bool _showTooltip = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _bounceAnimation = Tween<Offset>(
      begin: const Offset(0, 1.5),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();

    // Tooltip animation
    _tooltipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _tooltipFade = CurvedAnimation(
      parent: _tooltipController,
      curve: Curves.easeInOut,
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _tooltipController.forward();
        Future.delayed(const Duration(milliseconds: 2500), () {
          if (mounted) {
            _tooltipController.reverse();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _tooltipController.dispose();
    super.dispose();
  }

  void _updatePosition(Offset delta, BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final padding = MediaQuery.paddingOf(context);

    setState(() {
      double newX = position.dx + delta.dx;
      double newY = position.dy + delta.dy;

      final minX = padding.left + 8;
      final maxX = size.width - padding.right - 56;
      final minY = padding.top + 8;
      final maxY = size.height - padding.bottom - 56;

      newX = max(minX, min(newX, maxX));
      newY = max(minY, min(newY, maxY));

      position = Offset(newX, newY);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.elasticOut,
      left: position.dx,
      top: position.dy,
      child: GestureDetector(
        onPanUpdate: (details) => _updatePosition(details.delta, context),
        child: SlideTransition(
          position: _bounceAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  radius: 24,
                  child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.solidLightbulb,
                      size: 20,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    onPressed: () {
                      context.push(Routes.reviewQuizAnswersView);
                      if (_showTooltip) {
                        _tooltipController.reverse();
                        setState(() => _showTooltip = false);
                      }
                    },
                  ),
                ),
                if (_showTooltip)
                  Positioned(
                    top: -50,
                    left: -15,
                    child: FadeTransition(
                      opacity: _tooltipFade,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                              color: Theme.of(
                                context,
                              ).colorScheme.tertiaryContainer,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              child: Text(
                                "Review your Answers!",
                                style: Theme.of(context).textTheme.labelLarge
                                    ?.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 36),
                            child: ClipPath(
                              clipper: FloatingButtonDialogClipper(),
                              child: Container(
                                height: 12,
                                width: 12,
                                color: Theme.of(
                                  context,
                                ).colorScheme.tertiaryContainer,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
