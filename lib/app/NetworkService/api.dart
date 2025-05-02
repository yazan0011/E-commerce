import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkService {
  static const String baseUrl = 'https://your-api-url.com/api';

  static Future<http.Response> get(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    final uri =
        Uri.parse('$baseUrl$endpoint').replace(queryParameters: queryParams);
    return await http.get(uri, headers: _defaultHeaders(headers));
  }

  static Future<http.Response> post(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    return await http.post(
      uri,
      headers: _defaultHeaders(headers),
      body: jsonEncode(body),
    );
  }

  static Future<http.Response> put(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    return await http.put(
      uri,
      headers: _defaultHeaders(headers),
      body: jsonEncode(body),
    );
  }

  static Future<http.Response> delete(
    String endpoint, {
    Map<String, String>? headers,
  }) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    return await http.delete(uri, headers: _defaultHeaders(headers));
  }

  static Map<String, String> _defaultHeaders([Map<String, String>? custom]) {
    return {
      'Content-Type': 'application/json',
      ...?custom,
    };
  }
}
