import 'package:flutter/material.dart';
import 'dart:async';

class FeedbackProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _responseMessage = '';
  String get responseMessage => _responseMessage;

  Future<void> submitFeedback(String name, String email, String message) async {
    _isLoading = true;
    _responseMessage = '';
    notifyListeners();

    try {
      // Mock API call delay
      await Future.delayed(const Duration(seconds: 2));

      // Mock API success
      _responseMessage = "Feedback submitted successfully!";
    } catch (e) {
      _responseMessage = "Failed to submit feedback. Try again!";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
