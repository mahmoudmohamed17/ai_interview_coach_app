import 'part.dart';

class ContentModel {
  final List<Part>? parts;
  final String? role;

  const ContentModel({this.parts, this.role});

  @override
  String toString() => 'ContentModel(parts: $parts, role: $role)';

  Map<String, dynamic> toJson() => {
    'parts': parts?.map((x) => x.toJson()).toList(),
    'role': role,
  };

  factory ContentModel.fromJson(Map<String, dynamic> json) => ContentModel(
    parts: json['parts'] != null
        ? List<Part>.from(json['parts'].map((x) => Part.fromJson(x)))
        : null,
    role: json['role'],
  );
}
