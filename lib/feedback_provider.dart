import 'package:flutter/material.dart';
import 'dart:async';

class FeedbackProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _responseMessage = '';
  String get responseMessage => _responseMessage;

  // 🟢 Store submitted feedbacks here
  final List<Map<String, String>> _feedbackList = [];
  List<Map<String, String>> get feedbackList => _feedbackList;

  Future<void> submitFeedback(String name, String email, String message) async {
    _isLoading = true;
    _responseMessage = '';
    notifyListeners();

    try {
      // Simulate network delay (API call)
      await Future.delayed(const Duration(seconds: 2));

      // Simulate success
      _feedbackList.add({
        'name': name,
        'email': email,
        'message': message,
      });

      _responseMessage = "Feedback submitted successfully!";
    } catch (e) {
      _responseMessage = "Failed to submit feedback. Try again!";
    } finally {
      _isLoading = false;
      notifyListeners();

      // Clear success message after a short delay (optional)
      Timer(const Duration(seconds: 3), () {
        _responseMessage = '';
        notifyListeners();
      });
    }
  }
}
