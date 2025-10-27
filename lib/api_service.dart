import 'dart:convert';
import 'package:http/http.dart' as http;

/// ApiService with built-in mock fallback.
/// Set [useMock] to true to force mock responses (no network).
class ApiService {
  final String baseUrl = "https://reqres.in/api";
  final bool useMock;

  ApiService({this.useMock = false});

  /// LOGIN
  Future<Map<String, dynamic>> login(String email, String password) async {
    if (useMock) return await mockLogin(email, password);

    final url = '$baseUrl/login';
    try {
      final response = await http
          .post(Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'email': email, 'password': password}))
          .timeout(const Duration(seconds: 10));

      // If remote returns something (even an error body), parse it
      final body = _safeDecode(response.body);

      if (response.statusCode == 200) {
        return body;
      } else {
        throw Exception(body['error'] ?? 'Login failed (${response.statusCode})');
      }
    } catch (e) {
      // Network error or blocking; fall back to mock if desired
      print('⚠️ Network/login error: $e — falling back to mock');
      return await mockLogin(email, password);
    }
  }

  /// SIGNUP
  Future<Map<String, dynamic>> signup(String email, String password) async {
    if (useMock) return await mockSignup(email, password);

    final url = '$baseUrl/register';
    try {
      final response = await http
          .post(Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'email': email, 'password': password}))
          .timeout(const Duration(seconds: 10));

      final body = _safeDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return body;
      } else {
        throw Exception(body['error'] ?? 'Signup failed (${response.statusCode})');
      }
    } catch (e) {
      print('⚠️ Network/signup error: $e — falling back to mock');
      return await mockSignup(email, password);
    }
  }

  // Parse JSON safely
  Map<String, dynamic> _safeDecode(String raw) {
    try {
      if (raw.trim().isEmpty) return {};
      return jsonDecode(raw) as Map<String, dynamic>;
    } catch (e) {
      print('⚠️ Could not decode response JSON: $e');
      return {};
    }
  }

  // ---------------------
  // Mock helpers
  // ---------------------
  Future<Map<String, dynamic>> mockLogin(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1)); // simulate network
    // Accept the common test login credential or any non-empty for mock
    if (email == 'eve.holt@reqres.in' && password == 'cityslicka') {
      return {'token': 'mock_token_login_success'};
    }
    // For other emails, you can choose to allow or fail:
    return {'token': 'mock_token_for_${email.replaceAll(RegExp(r'[^a-z0-9]'), '_')}'};
    // Or to simulate failure:
    // throw Exception('Invalid credentials (mock)');
  }

  Future<Map<String, dynamic>> mockSignup(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    // Simulate the real ReqRes success for the sample user
    if (email == 'eve.holt@reqres.in' && password == 'pistol') {
      return {'id': 4, 'token': 'mock_token_signup_success'};
    }
    // Otherwise return a created token
    return {'id': 999, 'token': 'mock_token_signup_${email.hashCode}'};
  }
}
