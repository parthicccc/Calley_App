class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://mock-api.calleyacd.com/api';
  
  // Auth endpoints
  static const String register = '$baseUrl/auth/register';
  static const String login = '$baseUrl/auth/login';
  static const String sendOtp = '$baseUrl/auth/send-otp';
  static const String verifyOtp = '$baseUrl/auth/verify-otp';
  
  // List endpoints
  static String getList(String userId) => '$baseUrl/list?userId=$userId';
  static String getListStats(String listId) => '$baseUrl/list/$listId';
}