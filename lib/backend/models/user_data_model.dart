class UserDataModel {
  final String fullName;
  final String profilePicture;
  final String bio;
  final String phoneNumber; // without the country code
  final String countryCode;

  UserDataModel({
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
