class Part {
  final String? text;

  const Part({this.text});

  @override
  String toString() => 'Part(text: $text)';

  Map<String, dynamic> toJson() => {'text': text};

  factory Part.fromJson(Map<String, dynamic> json) =>
      Part(text: json['text'] as String?);
}
