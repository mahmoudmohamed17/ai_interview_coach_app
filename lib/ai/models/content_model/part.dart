import 'dart:convert';

class Part {
  final String? text;

  const Part({this.text});

  @override
  String toString() => 'Part(text: $text)';

  factory Part.fromMap(Map<String, dynamic> data) =>
      Part(text: data['text'] as String?);

  Map<String, dynamic> toMap() => {'text': text};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Part].
  factory Part.fromJson(String data) {
    return Part.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Part] to a JSON string.
  String toJson() => json.encode(toMap());

  Part copyWith({String? text}) {
    return Part(text: text ?? this.text);
  }
}
