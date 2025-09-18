import 'package:ai_interview_coach_app/backend/models/user_personal_info_item_model.dart';
import 'package:ai_interview_coach_app/cubits/auth_cubit.dart';
import 'package:ai_interview_coach_app/views/profile_view/bio_item.dart';
import 'package:ai_interview_coach_app/views/profile_view/joined_date_widget.dart';
import 'package:ai_interview_coach_app/views/profile_view/personal_info_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserPersonalInfoWidget extends StatelessWidget {
  const UserPersonalInfoWidget({super.key, required this.authCubit});
  final AuthCubit authCubit;

  @override
  Widget build(BuildContext context) {
    final userModel = authCubit.userModel;

    final items = [
      UserPersonalInfoItemModel(
        icon: FontAwesomeIcons.solidUser,
        label: 'Full name',
        value: userModel!.fullName,
      ),
      UserPersonalInfoItemModel(
        icon: FontAwesomeIcons.solidEnvelope,
        label: 'Email',
        value: authCubit.user!.email!,
      ),
      UserPersonalInfoItemModel(
        icon: FontAwesomeIcons.phone,
        label: 'Phone number',
        value: '${userModel.countryCode}${userModel.phoneNumber}',
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
          BioItem(bio: authCubit.userModel!.bio),
          JoinedDateWidget(joinedData: authCubit.user!.createdAt),
        ],
      ),
    );
  }
}
