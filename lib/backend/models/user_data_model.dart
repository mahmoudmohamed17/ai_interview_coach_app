class UserDataModel {
  final String fullName;
  final String profilePicture;

  UserDataModel({required this.fullName, required this.profilePicture});

  factory UserDataModel.formJson(Map<String, dynamic> json) {
    return UserDataModel(
      fullName: json['full_name'],
      profilePicture: json['profile_picture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'full_name': fullName, 'profile_picture': profilePicture};
  }

  UserDataModel copyWith({String? fullName, String? profilePicture}) {
    return UserDataModel(
      fullName: fullName ?? this.fullName,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }
}
