import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  static const Color mainPurple = Color(0xFF008080);
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> items = List.generate(6, (i) => 'Notification ${i + 1}');

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            // header with back arrow and title
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: mainPurple,
                border: Border(bottom: BorderSide(color: Colors.blueGrey.withOpacity(0.2))),
              ),
              padding: const EdgeInsets.fromLTRB(12, 14, 12, 18),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  const Text('Notification', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // list of rounded notification tiles
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                itemCount: items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // placeholder: you can navigate to detail if needed
                    },
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: mainPurple,
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(color: Colors.blueGrey.withOpacity(0.4)),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(items[index], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                          ),
                          const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 18),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // footer similar to home footer (small)
            Container(
              height: 64,
              decoration: const BoxDecoration(
                color: mainPurple,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(width: 36, height: 36, color: Colors.grey[300]),
                  Container(width: 36, height: 36, color: Colors.grey[300]),
                  Container(width: 36, height: 36, color: Colors.grey[300]),
                  Container(width: 36, height: 36, color: Colors.grey[300]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}