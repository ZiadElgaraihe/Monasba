import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  final String _baseUrl = 'http://192.168.1.12:2000/api/v1/';

  //post request
  Future<Map<String, dynamic>> post({
    required bool isSignUp,
    required bool isContentJson,
    required String restOfUrl,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    Map<String, String>? headers;

    if (isContentJson && token != null) {
      headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
    } else if (isContentJson) {
      headers = {
        'Content-Type': 'application/json',
      };
    } else if (token != null) {
      headers = {
        'Authorization': 'Bearer $token',
      };
    }

    http.Response response = await http.post(Uri.parse('$_baseUrl$restOfUrl'),
        body: jsonEncode(body), headers: headers);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      if (isSignUp) {
        throw Exception('${responseBody['errors'][0]['msg']}');
      } else {
        throw Exception('${responseBody['message']}');
      }
    }
  }

  //get request
  Future<Map<String, dynamic>> get({
    required String restOfUrl,
    String? token,
  }) async {
    Map<String, String>? headers;

    if (token != null) {
      headers = {
        'Authorization': 'Bearer $token',
      };
    }

    http.Response response = await http.get(
      Uri.parse('$_baseUrl$restOfUrl'),
      headers: headers,
    );

    Map<String, dynamic> responseBody = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return responseBody;
    } else {
      throw Exception('${responseBody['message']}');
    }
  }
}
