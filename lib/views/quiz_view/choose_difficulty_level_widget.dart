import 'package:ai_interview_coach_app/backend/models/interview_difficulty_level_model.dart';
import 'package:ai_interview_coach_app/views/quiz_view/interview_difficulty_level_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChooseDifficultyLevelWidget extends StatefulWidget {
  const ChooseDifficultyLevelWidget({super.key, this.onSelected});
  final Function(InterviewDifficultyLevelModel)? onSelected;

  @override
  State<ChooseDifficultyLevelWidget> createState() =>
      _ChooseDifficultyLevelWidgetState();
}

class _ChooseDifficultyLevelWidgetState
    extends State<ChooseDifficultyLevelWidget> {
  int _activeIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 10,
            children: [
              const Icon(
                FontAwesomeIcons.bullseye,
                color: Colors.orangeAccent,
                size: 18,
              ),
              Text(
                'Choose Difficulty Level',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 8,
              childAspectRatio: 4,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: difficultyLevels.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => setState(() {
                _activeIndex = index;
                widget.onSelected?.call(difficultyLevels[index]);
              }),
              child: InterviewDifficultyLevelItem(
                model: difficultyLevels[index],
                isActive: index == _activeIndex,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
