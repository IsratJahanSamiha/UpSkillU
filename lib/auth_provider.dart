import 'package:flutter/material.dart';
import 'api_service.dart';

class AuthProvider with ChangeNotifier {
  final ApiService api = ApiService(useMock: false); // ✅ Use mock

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _token;
  String? get token => _token;

  /// LOGIN
  Future<void> login(String email, String password, BuildContext context) async {
    _setLoading(true);

    try {
      final result = await api.login(email, password);
      _token = result['token'];
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login successful ✅')),
      );
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }

    _setLoading(false);
  }

  /// SIGNUP
  Future<void> signup(String email, String password, BuildContext context) async {
    _setLoading(true);

    try {
      final result = await api.signup(email, password);
      _token = result['token'];
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signup successful 🎉')),
      );
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }

    _setLoading(false);
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void logout(BuildContext context) {
    _token = null;
    notifyListeners();
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
  }

}
