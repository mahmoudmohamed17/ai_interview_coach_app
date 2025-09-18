import 'package:ai_interview_coach_app/views/home_view/home_view.dart';
import 'package:ai_interview_coach_app/views/profile_view/profile_view.dart';
import 'package:ai_interview_coach_app/cubits/auth_cubit.dart';
import 'package:ai_interview_coach_app/backend/services/supabase_auth_service.dart';

/// Used to store the user data that shows @[HomeView] and [ProfileView]
/// Basically deals with the [AuthCubit] and [SupabaseAuthService]
class UserDataModel {
  final String fullName;
  final String profilePicture;
  final String bio;
  final String phoneNumber;
  final String countryCode;

  const UserDataModel({
    required this.fullName,
    required this.profilePicture,
    required this.bio,
    required this.phoneNumber,
    required this.countryCode,
  });

  factory UserDataModel.formJson(Map<String, dynamic>? json) {
    return UserDataModel(
      fullName: json?['full_name'] ?? '',
      profilePicture: json?['profile_picture'] ?? '',
      bio: json?['bio'] ?? '',
      phoneNumber: json?['dial_info']['phone_number'] ?? '',
      countryCode: json?['dial_info']['country_code'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'profile_picture': profilePicture,
      'bio': bio,
      'dial_info': {'phone_number': phoneNumber, 'country_code': countryCode},
    };
  }

  UserDataModel copyWith({
    String? fullName,
    String? profilePicture,
    String? bio,
    String? phoneNumber,
    String? countryCode,
  }) {
    return UserDataModel(
      fullName: fullName ?? this.fullName,
      profilePicture: profilePicture ?? this.profilePicture,
      bio: bio ?? this.bio,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      countryCode: countryCode ?? this.countryCode,
    );
  }
}
