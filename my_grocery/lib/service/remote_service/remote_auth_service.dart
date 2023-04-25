import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../const.dart';

class RemoteAuthService {
  final http.Client _client = http.Client();

  Future<http.Response> signUp({
    required String email,
    required String password,
  }) async {
    final body = {"username": email, "email": email, "password": password};
    final response = await _client.post(
      Uri.parse('$baseUrl/api/auth/local/register'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    return response;
  }

  Future<http.Response> createProfile({
    required String fullName,
    required String token,
  }) async {
    final body = {"fullName": fullName};
    final response = await _client.post(
      Uri.parse('$baseUrl/api/profile/me'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(body),
    );
    return response;
  }

  Future<http.Response> signIn({
    required String email,
    required String password,
  }) async {
    final body = {"identifier": email, "password": password};
    final response = await _client.post(
      Uri.parse('$baseUrl/api/auth/local'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    return response;
  }

  Future<http.Response> getProfile({
    required String token,
  }) async {
    final response = await _client.get(
      Uri.parse('$baseUrl/api/profile/me'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return response;
  }
}
