import 'package:ai_interview_coach_app/views/auth_view/phone_number_widget.dart';
import 'package:ai_interview_coach_app/views/profile_view/editable_user_phone_number_widget.dart';

/// Used to set up user country code at signing up process or update profile
/// Model used @[PhoneNumberWidget] and [EditableUserPhoneNumberWidget]
class CountryCodeModel {
  final String dialCode;
  final String flag;

  const CountryCodeModel({required this.dialCode, required this.flag});
}
