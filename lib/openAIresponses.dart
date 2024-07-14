import 'dart:convert';
import 'package:http/http.dart' as http;

class openAI {
  final String APIKey =
      'Your APIKEY';

  Future<String> generateResponse(String prompt) async {
    final url = Uri.parse('https://api.openai.com/v1/completions');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $APIKey',
    };
    final body = jsonEncode({
      'model': 'gpt-3.5-turbo',
      'messages': [
        {'role': 'system', 'content': 'You are a helpful assistant.'},
        {'role': 'user', 'content': prompt},
      ],
      'max_tokens': 0,
    });

    final response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['message']['content'].trim();

    } else {
      throw Exception('Failed to generate response: ${response.body}');
      ;
    }
  }
}
