import 'dart:convert';
import 'part.dart';

class ContentModel {
  final List<Part>? parts;
  final String? role;

  const ContentModel({this.parts, this.role});

  @override
  String toString() => 'ContentModel(parts: $parts, role: $role)';

  factory ContentModel.fromMap(Map<String, dynamic> data) => ContentModel(
    parts: (data['parts'] as List<dynamic>?)
        ?.map((e) => Part.fromMap(e as Map<String, dynamic>))
        .toList(),
    role: data['role'] as String?,
  );

  Map<String, dynamic> toMap() => {
    'parts': parts?.map((e) => e.toMap()).toList(),
    'role': role,
  };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ContentModel].
  factory ContentModel.fromJson(String data) {
    return ContentModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ContentModel] to a JSON string.
  String toJson() => json.encode(toMap());

  ContentModel copyWith({List<Part>? parts, String? role}) {
    return ContentModel(parts: parts ?? this.parts, role: role ?? this.role);
  }
}
