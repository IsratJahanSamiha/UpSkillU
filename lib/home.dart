import 'package:flutter/material.dart';
import 'profile.dart';
import 'notification.dart';
import 'course_details.dart';
import 'course.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

/// Home page updated to include notification icon and footer with page names.
class _HomePageState extends State<HomePage> {
  static const Color mainPurple = Color(0xFF008080) ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // no AppBar; custom header to match wireframe
      body: SafeArea(
        child: Column(
          children: [
            // header with notification icon
            Container(
              width: double.infinity,
              color: mainPurple,
              padding: const EdgeInsets.fromLTRB(20, 18, 12, 18),
              child: Row(
                children: [
                  // welcome texts
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Welcome',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black)),
                        SizedBox(height: 6),
                        Text('Jahan', style: TextStyle(fontSize: 20, color: Colors.black54)),
                      ],
                    ),
                  ),

                  // notification icon
                  IconButton(
                    icon: const Icon(Icons.notifications, color: Colors.black87),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const NotificationPage()),
                      );
                    },
                  ),
                ],
              ),
            ),

            // content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // search
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(4)),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Course',
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Recent label
                    const Text('Recent', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),

                    // Horizontal slider for recent watched courses
                    SizedBox(
                      height: 120,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: filteredCourses.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          final course = filteredCourses[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      CourseDetailsPage(course: course),
                                ),
                              );
                            },
                            child: Container(
                              width: 260,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: const [
                                  BoxShadow(color: Colors.black12, blurRadius: 3, offset: Offset(0, 2))
                                ],
                                border: Border.all(
                                  color: index == 0 ? Colors.blueAccent : Colors.transparent,
                                  width: 2,
                                ),
                              ),
                              padding: const EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(course.title,
                                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                                  const SizedBox(height: 8),
                                  Text(course.subtitle, style: const TextStyle(fontSize: 14, color: Colors.black54)),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 20),
                    const Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),

                    // Categories grid
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.6 / 1,
                      children: [
                        _buildCategoryTile(title: 'Courses', onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => const Course()));
                        }),
                        _buildCategoryTile(title: 'Announcements', onTap: () {}),
                        _buildCategoryTile(title: 'Events', onTap: () {}),
                        _buildCategoryTile(title: 'Faculties', onTap: () {}),
                      ],
                    ),

                    const SizedBox(height: 80), // space above footer
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // footer with page names and square placeholders per wireframe
      bottomNavigationBar: Container(
        height: 78,
        decoration: const BoxDecoration(
          color: mainPurple,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Dashboard
                GestureDetector(
                  onTap: () {
                    // already on home/dashboard; keep as no-op or scroll to top
                    // scroll to top example:
                    // implement if required
                  },
                  child: Column(
                    children: [
                      Container(width: 36, height: 36, color: Colors.grey[300]),
                      const SizedBox(height: 6),
                      const Text('Dashboard', style: TextStyle(fontSize: 12, color: Colors.black87)),
                    ],
                  ),
                ),

                // Programs
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const Course()));
                  },
                  child: Column(
                    children: [
                      Container(width: 36, height: 36, color: Colors.grey[300]),
                      const SizedBox(height: 6),
                      const Text('Programs', style: TextStyle(fontSize: 12, color: Colors.black87)),
                    ],
                  ),
                ),

                // Listings
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) =>  Course()));
                  },
                  child: Column(
                    children: [
                      Container(width: 36, height: 36, color: Colors.grey[300]),
                      const SizedBox(height: 6),
                      const Text('Listings', style: TextStyle(fontSize: 12, color: Colors.black87)),
                    ],
                  ),
                ),

                // Profile
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage()));
                  },
                  child: Column(
                    children: [
                      Container(width: 36, height: 36, color: Colors.grey[300]),
                      const SizedBox(height: 6),
                      const Text('Profile', style: TextStyle(fontSize: 12, color: Colors.black87)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTile({required String title, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 3, offset: Offset(0, 2))],
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      ),
    );
  }
}




