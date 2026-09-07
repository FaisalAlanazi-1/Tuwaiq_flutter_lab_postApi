import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future<String> sendRequest(String message) async {
    String link =
        'https://generativelanguage.googleapis.com/v1beta/interactions';
    Map<String, String>? header = {
      'x-goog-api-key': '',
      'Content-Type': 'application/json',
      "Api-Revision": "2026-05-20",
    };
    
    Map<String, String> body = {"model": "gemini-3.8-flash", "input": message};
    var request = await http.post(Uri.parse(link), headers: header, body: jsonEncode(body));
    var responseBody = request.body;
    var data = jsonDecode(responseBody);
    return data["steps"][1]["content"][0]["text"].toString();
  }
}
