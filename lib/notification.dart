import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  // 🔔 Sample Notifications List
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'New Flutter Course Released!',
      'message': 'Check out the latest course on Flutter State Management.',
      'time': '2 hours ago',
      'type': 'course',
    },
    {
      'title': 'System Maintenance Scheduled',
      'message': 'The app will be under maintenance tonight from 10PM.',
      'time': '5 hours ago',
      'type': 'announcement',
    },
    {
      'title': 'Event: Tech Talk Tomorrow',
      'message': 'Join our live session on UI/UX Design Trends.',
      'time': '1 day ago',
      'type': 'event',
    },
    {
      'title': 'Reminder: Assignment Deadline',
      'message': 'Don’t forget to submit your project by tonight.',
      'time': '2 days ago',
      'type': 'reminder',
    },
  ];

  IconData _getIcon(String type) {
    switch (type) {
      case 'course':
        return Icons.school;
      case 'announcement':
        return Icons.campaign;
      case 'event':
        return Icons.event;
      case 'reminder':
        return Icons.alarm;
      default:
        return Icons.notifications;
    }
  }

  Color _getColor(String type) {
    switch (type) {
      case 'course':
        return const Color(0xFF008080);
      case 'announcement':
        return Colors.orange;
      case 'event':
        return Colors.purple;
      case 'reminder':
        return Colors.redAccent;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),

      appBar: AppBar(
        backgroundColor: const Color(0xFF008080),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      body: notifications.isEmpty
          ? const Center(
        child: Text(
          'No new notifications 😊',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];
          final icon = _getIcon(item['type']);
          final color = _getColor(item['type']);

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: color.withOpacity(0.15),
                radius: 25,
                child: Icon(icon, color: color, size: 28),
              ),
              title: Text(
                item['title'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    item['message'],
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item['time'],
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert, color: Colors.grey),
                onPressed: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}
