import 'dart:convert';

Map<String, dynamic> cleanBotResponse(String response) {
  final output = response.replaceAll(RegExp(r"```[a-zA-Z]*"), "").trim();
  final result = jsonDecode(output);
  return result;
}
