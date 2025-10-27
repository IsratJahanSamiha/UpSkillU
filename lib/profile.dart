import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key}); // ✅ super parameter

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static const Color mainTeal = Color(0xFFA5A6F6);
  bool isLoggingOut = false;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: mainTeal,
        elevation: 0,
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            // 🧍 Profile Avatar
            Center(
              child: CircleAvatar(
                radius: 48,
                backgroundColor: Color(0xFFA5A6F6),
                child: const Icon(Icons.person, size: 48, color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),

            // 🏫 User Info
            const Text(
              'Full Name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'School/University Name',
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),

            const SizedBox(height: 20),

            // 📊 Stats
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatItem('120', 'Credits'),
                    _buildStatItem('3.8', 'Grade Points'),
                    _buildStatItem('3.7', 'GPA'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ⚙️ Action Buttons
            _buildMenuItem(
              icon: Icons.book,
              title: 'Enrolled Courses',
              onTap: () => Navigator.pushNamed(context, '/programs'),
            ),
            _buildMenuItem(
              icon: Icons.check_circle,
              title: 'Completed Courses',
              onTap: () => Navigator.pushNamed(context, '/programs'),
            ),
            _buildMenuItem(
              icon: Icons.emoji_events,
              title: 'Activities & Badges',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.settings,
              title: 'Settings',
              onTap: () {},
            ),

            const SizedBox(height: 24),

            // 🚪 Logout Button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFA5A6F6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: const Size(double.infinity, 48),
              ),
              icon: isLoggingOut
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.logout, color: Colors.white),
              label: Text(
                isLoggingOut ? "Logging out..." : "Log Out",
                style: const TextStyle(color: Colors.white),
              ),
              onPressed: isLoggingOut
                  ? null
                  : () async {
                      setState(() => isLoggingOut = true);
                      await authProvider.logout(context);
                      setState(() => isLoggingOut = false);
                    },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: mainTeal,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: mainTeal),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
