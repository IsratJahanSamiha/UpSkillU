import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'course_details.dart';
import 'course_provider.dart';
import 'home.dart';
import 'notification.dart';
import 'feedback_page.dart';
import 'profile.dart';

class Course extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  List<Map<String, String>> allCourses = [];
  List<Map<String, String>> filteredCourses = [];
  bool isLoading = true;
  TextEditingController searchController = TextEditingController();

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<CourseProvider>(context, listen: false);
      setState(() {
        isLoading = provider.isLoading;
        allCourses = List<Map<String, String>>.from(provider.courses);
        filteredCourses = allCourses;
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NotificationPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FeedbackPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;
    }
  }

  void filterCourses(String query) {
    final provider = Provider.of<CourseProvider>(context, listen: false);
    final base = provider.courses;
    final input = query.toLowerCase();
    final results = base.where((course) {
      final title = (course['title'] ?? '').toLowerCase();
      final instructor = (course['instructor'] ?? '').toLowerCase();
      return title.contains(input) || instructor.contains(input);
    }).toList();

    setState(() => filteredCourses = results);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: const Color(0xFFA5A6F6),
          elevation: 0,
          title: const Text(
            "Choose Your Courses",
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                print('Logo clicked!');
              },
              icon: Image.asset(
                'assets/eceleratelogo.png',
                height: 80,
                width: 80,
              ),
            ),
          ],
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),
      ),

      body: Consumer<CourseProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (allCourses.isEmpty) {
            allCourses = List<Map<String, String>>.from(provider.courses);
            filteredCourses = allCourses;
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: searchController,
                  onChanged: filterCourses,
                  decoration: InputDecoration(
                    hintText: "Search for courses, categories, or topics...",
                    prefixIcon: const Icon(Icons.search, color: Color(0xFF008080)),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Suggested Courses",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: filteredCourses.isEmpty
                    ? const Center(
                        child: Text(
                          "No course found 😢",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: filteredCourses.length,
                        itemBuilder: (context, index) {
                          final course = filteredCourses[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CourseDetailsPage(course: course),
                                ),
                              );
                            },
                            child: Card(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 3,
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      bottomLeft: Radius.circular(16),
                                    ),
                                    child: Image.asset(
                                      course["image"] ?? 'assets/logo.PNG',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            course["title"] ?? '',
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            "Instructor: ${course["instructor"] ?? 'Unknown'}",
                                            style: const TextStyle(color: Colors.grey),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            "Start Date: ${course["startDate"] ?? "Coming Soon"}",
                                            style: const TextStyle(color: Colors.grey),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            course["description"] ?? '',
                                            style: const TextStyle(color: Colors.grey),
                                          ),
                                          const SizedBox(height: 10),
                                          const Row(
                                            children: [
                                              Icon(Icons.star, color: Colors.amber, size: 18),
                                              Icon(Icons.star, color: Colors.amber, size: 18),
                                              Icon(Icons.star, color: Colors.amber, size: 18),
                                              Icon(Icons.star_half, color: Colors.amber, size: 18),
                                              Icon(Icons.star_border, color: Colors.amber, size: 18),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),

      // ✅ Bottom Navigation Bar (SAME AS HOME)
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFA5A6F6),
        selectedItemColor: const Color(0xFF008080),
        unselectedItemColor: Colors.black54,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.feedback), label: 'Feedback'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
