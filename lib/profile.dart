import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static const Color mainPurple = Color(0xFF008080);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header and avatar
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 140,
                    width: double.infinity,
                    color: mainPurple,
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
                  Positioned(
                    top: 90,
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
                          const Text('Full Name',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 6),
                          const Text('School/University Name',
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black54)),
                          const SizedBox(height: 20),
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
                          _roundedAction(context, 'Enrolled Courses', () {
                            Navigator.pushNamed(context, '/programs');
                          }),
                          const SizedBox(height: 12),
                          _roundedAction(context, 'Completed Courses', () {
                            Navigator.pushNamed(context, '/programs');
                          }),
                          const SizedBox(height: 12),
                          _roundedAction(context, 'Activities & Badges', () {}),
                          const SizedBox(height: 12),
                          _roundedAction(context, 'Settings', () {}),
                          const SizedBox(height: 18),

                          // ✅ Logout Button
                          GestureDetector(
                            onTap: () {
                              final authProvider = Provider.of<AuthProvider>(context, listen: false);
                              authProvider.logout(context);
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
                              child: const Text('Log Out',
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
