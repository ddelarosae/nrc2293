import 'dart:convert';

void main() {
  String jsonString = '{"cantidad": 3, "origen": "Colombia"}';

  Map<String, dynamic> user = jsonDecode(jsonString);

  print("Howdy, ${user['cantidad']}!");
  print("We sent the verification link to ${user['origen']}.");
}
