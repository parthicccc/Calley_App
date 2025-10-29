import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/api_constants.dart';

class ApiService {
  static Future register({
    required String username,
    required String email,
    required String password,
  }) async {
    return await http.post(
      Uri.parse(ApiConstants.register),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
      }),
    );
  }

  static Future sendOtp(String email) async {
    return await http.post(
      Uri.parse(ApiConstants.sendOtp),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );
  }

  static Future verifyOtp({
    required String email,
    required String otp,
  }) async {
    return await http.post(
      Uri.parse(ApiConstants.verifyOtp),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'otp': otp,
      }),
    );
  }

  static Future login({
    required String email,
    required String password,
  }) async {
    return await http.post(
      Uri.parse(ApiConstants.login),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
  }

  static Future getList(String userId) async {
    return await http.get(Uri.parse(ApiConstants.getList(userId)));
  }

  static Future getListStats(String listId) async {
    return await http.get(Uri.parse(ApiConstants.getListStats(listId)));
  }
}