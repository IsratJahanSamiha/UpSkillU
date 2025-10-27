import 'package:flutter/material.dart';
import 'mock_api_service.dart';

/// Provider that manages course data fetched from [MockApiService].
///
/// Keeps the shape as List<Map<String, String>> to match the existing UI
/// code in this repository. When switching to a real API, change the types
/// to model classes and update serialization accordingly.
class CourseProvider with ChangeNotifier {
  final MockApiService api;

  CourseProvider({MockApiService? api}) : api = api ?? MockApiService() {
    // Start an initial load when provider is created.
    // We intentionally don't await here; callers should read `isLoading`.
    fetchCourses();
  }

  List<Map<String, String>> _courses = [];
  bool _isLoading = false;

  List<Map<String, String>> get courses => _courses;
  bool get isLoading => _isLoading;

  /// Fetch courses asynchronously from the mock API.
  Future<void> fetchCourses() async {
    _setLoading(true);
    try {
      final data = await api.fetchCourses();
      _courses = data;
    } catch (e) {
      // In a production app, handle/log error and possibly retry
      debugPrint('Error fetching courses: $e');
      _courses = [];
    } finally {
      _setLoading(false);
    }
  }

  /// Add a course (local + mock backend).
  Future<void> addCourse(Map<String, String> course) async {
    await api.addCourse(course);
    _courses.add(Map<String, String>.from(course));
    notifyListeners();
  }

  /// Update a course by id (local + mock backend).
  Future<bool> updateCourse(String id, Map<String, String> update) async {
    final ok = await api.updateCourseById(id, update);
    if (ok) {
      final idx = _courses.indexWhere((c) => c['id'] == id);
      if (idx != -1) {
        _courses[idx] = {..._courses[idx], ...update};
        notifyListeners();
      }
    }
    return ok;
  }

  /// Remove a course by id (local + mock backend).
  Future<bool> removeCourse(String id) async {
    final ok = await api.removeCourseById(id);
    if (ok) {
      _courses.removeWhere((c) => c['id'] == id);
      notifyListeners();
    }
    return ok;
  }

  void _setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }
}
