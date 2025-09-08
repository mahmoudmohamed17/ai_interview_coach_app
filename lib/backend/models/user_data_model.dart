class UserDataModel {
  final String fullName;
  final String profilePicture;
  final String bio;
  final String phoneNumber;

  UserDataModel({
    required this.fullName,
    required this.profilePicture,
    required this.bio,
    required this.phoneNumber,
  });

  factory UserDataModel.formJson(Map<String, dynamic> json) {
    return UserDataModel(
      fullName: json['raw_user_meta_data']['full_name'],
      profilePicture: json['raw_user_meta_data']['profile_picture'],
      bio: json['raw_user_meta_data']['bio'],
      phoneNumber: json['raw_user_meta_data']['phone_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'profile_picture': profilePicture,
      'bio': bio,
      'phone_number': phoneNumber,
    };
  }

  UserDataModel copyWith({
    String? fullName,
    String? profilePicture,
    String? bio,
    String? phoneNumber,
  }) {
    return UserDataModel(
      fullName: fullName ?? this.fullName,
      profilePicture: profilePicture ?? this.profilePicture,
      bio: bio ?? this.bio,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
