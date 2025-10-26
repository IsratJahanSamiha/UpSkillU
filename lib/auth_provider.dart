import 'package:flutter/material.dart';
import 'api_service.dart';

class AuthProvider with ChangeNotifier {
  final ApiService api = ApiService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _token;
  String? get token => _token;

  Future<void> login(String email, String password, BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await api.login(email, password);
      _token = result['token']; // mock token from API
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login successful ✅')),
      );
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }

    _isLoading = false;
    notifyListeners();
  }
}
