import 'dart:async';

/// Mock API service that simulates backend calls for courses.
///
/// This file intentionally uses plain Map<String, String> course objects to
/// match the existing UI code in the project (which expects maps). When
/// moving to a real API, replace these map shapes with proper model classes
/// and JSON (de-)serialization.
class MockApiService {
  // Internal in-memory list to allow dynamic changes from the mock side.
  final List<Map<String, String>> _courses = [
    {
      'id': '1',
      'title': 'Flutter Development',
      'description':
          'Learn how to build cross-platform mobile apps with Flutter. Covers Dart basics, UI, and backend integration.',
      'duration': '6 weeks',
      'image': 'assets/flutter_logo.png',
      'instructor': 'Angela Yu',
      'startDate': '25 Oct 2025',
      'schedule': 'Mon & Wed, 6-8pm',
      'eligibility': 'Beginner friendly',
    },
    {
      'id': '2',
      'title': 'Web Design Basics',
      'description':
          'Master HTML, CSS, and responsive design to create stunning websites.',
      'duration': '4 weeks',
      'image': 'assets/weblogo.png',
      'instructor': 'John Smith',
      'startDate': '15 Nov 2025',
      'schedule': 'Tue & Thu, 7-9pm',
      'eligibility': 'No prerequisites',
    },
    {
      'id': '3',
      'title': 'Python for Beginners',
      'description':
          'A beginner-friendly guide to Python — from syntax to automation projects.',
      'duration': '5 weeks',
      'image': 'assets/pythonlogo.png',
      'instructor': 'Jane Doe',
      'startDate': '01 Dec 2025',
      'schedule': 'Weekend, 10am-1pm',
      'eligibility': 'No prerequisites',
    },
    {
      'id': '4',
      'title': 'Java for Beginners',
      'description':
          'A practical introduction to Java programming: basics, OOP, and simple projects to build confidence.',
      'duration': '5 weeks',
      'image': 'assets/javalogo.png',
      'instructor': 'Jane Doe',
      'startDate': '10 Jan 2026',
      'schedule': 'Mon & Wed, 7-9pm',
      'eligibility': 'No prerequisites',
    },
  ];

  /// Simulates fetching courses from a backend with a short delay.
  Future<List<Map<String, String>>> fetchCourses({
    Duration delay = const Duration(seconds: 1),
  }) async {
    // Simulate network latency
    await Future.delayed(delay);
    // Return a copy so callers cannot mutate the internal list directly.
    return List<Map<String, String>>.from(
      _courses.map((c) => Map<String, String>.from(c)),
    );
  }

  /// Replace the current mock data (useful for tests or dynamic changes).
  Future<void> replaceCourses(List<Map<String, String>> newCourses) async {
    // Small delay to simulate server-side update
    await Future.delayed(const Duration(milliseconds: 300));
    _courses
      ..clear()
      ..addAll(newCourses.map((c) => Map<String, String>.from(c)));
  }

  /// Add a single course to the mock backend.
  Future<void> addCourse(Map<String, String> course) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _courses.add(Map<String, String>.from(course));
  }

  /// Update a course by id. Returns true if updated.
  Future<bool> updateCourseById(String id, Map<String, String> updated) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final idx = _courses.indexWhere((c) => c['id'] == id);
    if (idx == -1) return false;
    _courses[idx] = {..._courses[idx], ...updated};
    return true;
  }

  /// Remove a course by id. Returns true if removed.
  Future<bool> removeCourseById(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final before = _courses.length;
    _courses.removeWhere((c) => c['id'] == id);
    return _courses.length < before;
  }
}
