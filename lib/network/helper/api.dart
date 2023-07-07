import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  final String _baseUrl = 'http://192.168.1.3:2000/api/v1/auth/';
  Future<Map<String, dynamic>> post(
      {required String restOfUrl, required Map<String, dynamic> body}) async {
    http.Response response = await http.post(Uri.parse('$_baseUrl$restOfUrl'),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
        });
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      throw Exception('${responseBody['errors'][0]['msg']}');
    }
  }
}
