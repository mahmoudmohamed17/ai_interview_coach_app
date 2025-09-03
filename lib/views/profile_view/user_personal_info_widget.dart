import 'package:ai_interview_coach_app/backend/models/personal_info_model.dart';
import 'package:ai_interview_coach_app/views/profile_view/bio_item.dart';
import 'package:ai_interview_coach_app/views/profile_view/joined_date_widget.dart';
import 'package:ai_interview_coach_app/views/profile_view/personal_info_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserPersonalInfoWidget extends StatelessWidget {
  const UserPersonalInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      PersonalInfoModel(
        icon: FontAwesomeIcons.solidUser,
        label: 'Full name',
        value: 'Mahmoud Mohamed',
      ),
      PersonalInfoModel(
        icon: FontAwesomeIcons.solidEnvelope,
        label: 'Email',
        value: 'mahmoud123@gmail.com',
      ),
      PersonalInfoModel(
        icon: FontAwesomeIcons.phone,
        label: 'Phone number',
        value: '+201127243403',
      ),
    ];
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          ...items.map((item) => PersonalInfoItem(model: item)),
          const BioItem(),
          const JoinedDateWidget(),
        ],
      ),
    );
  }
}
