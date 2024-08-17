import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ApiMethod { GET, POST, PUT, DELETE }

class ApiException implements Exception {
  final String message;
  final int statusCode;

  ApiException(this.message, this.statusCode);

  @override
  String toString() => 'ApiException: $message (Status code: $statusCode)';
}

class Api {
  static final String _prefix = '${dotenv.env['VITE_API_URL']!}/';
  static String? _sessionId;

  static Future<void> _loadSessionId() async {
    final prefs = await SharedPreferences.getInstance();
    _sessionId = prefs.getString('sessionId');
  }

  static Future<void> _saveSessionId(String sessionId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('sessionId', sessionId);
    _sessionId = sessionId;
  }

  static String? encodeBody(Object? body) {
    return body != null ? jsonEncode(body) : null;
  }

  static Future<http.Response> wrappedFetch(String url, ApiMethod method,
      {Object? body}) async {
    await _loadSessionId();
    final Uri uri = Uri.parse(_prefix + url);
    final headers = {
      'Content-Type': 'application/json',
      if (_sessionId != null) 'Cookie': 'JSESSIONID=$_sessionId',
    };

    try {
      http.Response response = await switch (method) {
        ApiMethod.GET => http.get(uri, headers: headers),
        ApiMethod.POST =>
          http.post(uri, headers: headers, body: encodeBody(body)),
        ApiMethod.PUT =>
          http.put(uri, headers: headers, body: encodeBody(body)),
        ApiMethod.DELETE =>
          http.delete(uri, headers: headers, body: encodeBody(body))
      };

      // Check for and save new session ID
      String? setCookie = response.headers['set-cookie'];
      if (setCookie != null) {
        String? sessionId = setCookie
            .split(';')
            .firstWhere(
              (item) => item.trim().startsWith('JSESSIONID='),
              orElse: () => '',
            )
            .split('=')
            .last;
        if (sessionId.isNotEmpty) {
          await _saveSessionId(sessionId);
        }
      }

      if (response.statusCode == 200 || response.statusCode == 204) {
        return response;
      } else if (response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 404 ||
          response.statusCode == 500) {
        switch (response.statusCode) {
          case 400:
            throw ApiException("Bad request", 400);
          case 401:
            throw ApiException("Unauthorized", 401);
          case 404:
            throw ApiException("Not found", 404);
          case 500:
            throw ApiException("Internal server error", 500);
        }
      }
      throw ApiException("Unhandled status code", response.statusCode);
    } catch (e) {
      if (e is ApiException) {
        rethrow;
      }
      throw ApiException("Network error", 0);
    }
  }
}
