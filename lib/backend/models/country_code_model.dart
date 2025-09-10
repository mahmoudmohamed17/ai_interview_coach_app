import 'package:ai_interview_coach_app/core/constants/app_assets.dart';

class CountryCodeModel {
  final String dialCode;
  final String flag;

  CountryCodeModel({required this.dialCode, required this.flag});
}

final countriesCodes = [
  CountryCodeModel(dialCode: '+966', flag: AppAssets.iconsSaudiArabia),
  CountryCodeModel(dialCode: '+20', flag: AppAssets.iconsEgypt),
  CountryCodeModel(dialCode: '+1', flag: AppAssets.iconsUsa),
];
