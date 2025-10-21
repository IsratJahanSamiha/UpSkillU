import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const Color mainPurple = Color(0xFF008080);

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header area and overlapping card
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // Purple header
                  Container(
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: mainPurple,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, top: 8),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.arrow_back,
                              color: Colors.white, size: 28),
                        ),
                      ),
                    ),
                  ),

                  // Center avatar
                  Positioned(
                    top: 32,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 92,
                        height: 92,
                        decoration: BoxDecoration(
                          color: mainPurple,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.blueGrey.withOpacity(0.3)),
                        ),
                        child: const Center(
                          child:
                          Icon(Icons.person, size: 42, color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  // Card body overlapping header
                  Positioned(
                    top: 80,
                    left: 20,
                    right: 20,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 70, 20, 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 2))
                        ],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 4),
                          const Text('Full Name',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 6),
                          const Text('School/University Name',
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black54)),

                          const SizedBox(height: 20),

                          // Stats row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _statBox('120', 'Cumulative\nCredits'),
                              const SizedBox(width: 10),
                              _statBox('3.8', 'Cumulative\nGrade Points'),
                              const SizedBox(width: 10),
                              _statBox('3.7', 'Cumulative\nGPA'),
                            ],
                          ),

                          const SizedBox(height: 20),

                          // Action buttons
                          _roundedAction(context, 'Enrolled Courses', () {
                            Navigator.pushNamed(context, '/programs');
                          }),
                          const SizedBox(height: 12),
                          _roundedAction(context, 'Completed Courses', () {
                            Navigator.pushNamed(context, '/programs');
                          }),
                          const SizedBox(height: 12),
                          _roundedAction(context, 'Activities & Badges', () {
                            // No navigation for this placeholder, could be pushNamed('/activities')
                          }),
                          const SizedBox(height: 12),
                          _roundedAction(context, 'Settings', () {
                            // No navigation for this placeholder, could be pushNamed('/settings')
                          }),
                          const SizedBox(height: 18),

                          // Logout small pill
                          GestureDetector(
                            onTap: () {
                              Navigator.popUntil(
                                  context, (route) => route.isFirst);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 26, vertical: 10),
                              decoration: BoxDecoration(
                                color: mainPurple,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: Colors.blueGrey.withOpacity(0.2)),
                              ),
                              child: const Text('LogOut',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statBox(String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 66,
            height: 42,
            decoration: BoxDecoration(
              color: mainPurple,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blueGrey.withOpacity(0.2)),
            ),
            child: Center(
              child: Text(value,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          ),
          const SizedBox(height: 8),
          Text(label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _roundedAction(BuildContext context, String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: mainPurple,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: Colors.blueGrey.withOpacity(0.2)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: Text(text,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600)),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
          ],
        ),
      ),
    );
  }
}

// A placeholder page for the '/programs' route.
class ProgramsPage extends StatelessWidget {
  const ProgramsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Programs and Courses'),
        backgroundColor: ProfilePage.mainPurple,
        iconTheme: const IconThemeData(
            color: Colors.white), // Ensure back arrow is visible
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.school, size: 60, color: ProfilePage.mainPurple),
            const SizedBox(height: 20),
            const Text(
              'This is the Programs & Courses Page',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),
            const SizedBox(height: 10),
            const Text(
              'Content about enrolled and completed courses would go here.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ProfilePage.mainPurple,
                foregroundColor: Colors.white,
                padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text('Back to Profile'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Profile Application',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ProfilePage(),
      routes: <String, WidgetBuilder>{
        '/programs': (BuildContext context) => const ProgramsPage(),
        // Add other routes here if needed, e.g., '/activities', '/settings'
      },
      debugShowCheckedModeBanner: false, // Hides the debug banner
    );
  }
}