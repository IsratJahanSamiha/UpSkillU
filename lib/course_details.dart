import 'package:flutter/material.dart';

class CourseDetailsPage extends StatefulWidget {
  final Map<String, String> course;

  const CourseDetailsPage({super.key, required this.course});

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  bool isEnrolled = false;
  int _selectedIndex = 0;

  final TextEditingController _feedbackController = TextEditingController();
  final List<String> _feedbackList = [];

  void _submitFeedback() {
    final feedback = _feedbackController.text.trim();
    if (feedback.isNotEmpty) {
      setState(() {
        _feedbackList.add(feedback);
        _feedbackController.clear();
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("✅ Feedback submitted!")));
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle navigation logic here
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/tasks');
        break;
      case 2:
        Navigator.pushNamed(context, '/feedback');
        break;
      case 3:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final course = widget.course;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          title: const Text(
            "Course Details",
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFA5A6F6), Color(0xFF8A8BF0)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          elevation: 0.0,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),
      ),

      // ✅ Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Course Image
              Image.asset(
                course["image"] ?? 'assets/default.png',
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),

              // Course Info
              Text(
                course["title"] ?? "",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Instructor: ${course["instructor"] ?? "Unknown"}",
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 16),

              const Text(
                "Program Description",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                course["description"] ??
                    "No description available for this course.",
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 16),

              const Text(
                "Schedule",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                course["schedule"] ?? "Schedule details will be updated soon.",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),

              const Text(
                "Eligibility Criteria",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                course["eligibility"] ??
                    "Eligibility details will be updated soon.",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),

              // ✅ Enroll Button
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      isEnrolled = !isEnrolled;
                    });
                  },
                  icon: Icon(
                    isEnrolled ? Icons.check_circle : Icons.play_arrow,
                    color: Colors.white,
                  ),
                  label: Text(
                    isEnrolled ? "Enrolled" : "Enroll Now",
                    style: const TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isEnrolled
                        ? Colors.pinkAccent
                        : Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
              const Divider(thickness: 1),

              // 💬 Feedback Section
              const Text(
                "Feedback",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _feedbackController,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: "Write your feedback here...",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _submitFeedback,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 20,
                  ),
                ),
                child: const Text(
                  "Submit Feedback",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),

              if (_feedbackList.isEmpty)
                const Text(
                  "No feedback yet.",
                  style: TextStyle(color: Colors.grey),
                )
              else
                ListView.builder(
                  itemCount: _feedbackList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      leading: const Icon(Icons.comment, color: Colors.teal),
                      title: Text(_feedbackList[index]),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),

      // ✅ Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFA5A6F6),
        selectedItemColor: const Color(0xFF008080),
        unselectedItemColor: Colors.black54,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Tasks'),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback),
            label: 'Feedback',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
