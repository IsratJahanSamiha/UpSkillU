import 'package:flutter_test/flutter_test.dart';
import 'package:upskillu/mock_api_service.dart';

void main() {
  test(
    'MockApiService.fetchCourses returns non-empty list with required fields',
    () async {
      final api = MockApiService();

      // Use a shorter delay in tests to speed up execution
      final courses = await api.fetchCourses(
        delay: const Duration(milliseconds: 10),
      );

      expect(courses, isNotEmpty);

      for (final c in courses) {
        expect(c.containsKey('id'), isTrue);
        expect(c.containsKey('title'), isTrue);
        expect(c.containsKey('description'), isTrue);
      }

      // Ensure the newly added mock course with id '4' is present
      expect(courses.any((c) => c['id'] == '4'), isTrue);
    },
  );

  test('MockApiService add/update/remove work as expected', () async {
    final api = MockApiService();

    final newCourse = {
      'id': '999',
      'title': 'Test Course',
      'description': 'Temporary test',
      'image': 'assets/logo.PNG',
    };

    await api.addCourse(newCourse);
    var courses = await api.fetchCourses(
      delay: const Duration(milliseconds: 10),
    );
    expect(courses.any((c) => c['id'] == '999'), isTrue);

    final updated = {'title': 'Updated Test Course'};
    final updatedOk = await api.updateCourseById('999', updated);
    expect(updatedOk, isTrue);
    courses = await api.fetchCourses(delay: const Duration(milliseconds: 10));
    expect(
      courses.firstWhere((c) => c['id'] == '999')['title'],
      equals('Updated Test Course'),
    );

    final removed = await api.removeCourseById('999');
    expect(removed, isTrue);
    courses = await api.fetchCourses(delay: const Duration(milliseconds: 10));
    expect(courses.any((c) => c['id'] == '999'), isFalse);
  });
}
