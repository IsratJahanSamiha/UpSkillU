//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'course_details.dart' ;

class Course extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CourseState();
}

class _CourseState extends State<Course> {

  List<Map<String, String>> allCourses = [];
  List<Map<String, String>> filteredCourses = [];
  bool isLoading = true;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Simulate data loading (like fetching from API)
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
        allCourses = [
          {
            "title": "Flutter Development",
            "instructor": "Angela Yu",
            "image": "assets/flutter_logo.png",
            "startDate": "25 Oct 2025",
            "description":
            "Learn how to build cross-platform mobile apps with Flutter"
                "Covers Dart basics, UI design, and backend integration."
          },
          {
            "title": "Web Design Basics",
            "instructor": "John Smith",
            "image": "assets/weblogo.png",
            "startDate": "25 Oct 2025",
            "description":
            "Master HTML, CSS, and responsive design to create stunning websites."
          },
          {
            "title": "Python for Beginners",
            "instructor": "Jane Doe",
            "image": "assets/pythonlogo.png",
            "startDate": "25 Oct 2025",
            "description":
            "A beginner-friendly guide to Python — from syntax to automation projects."
          },
          {
            "title": "Java for Beginners",
            "instructor": "Jane Doe",
            "image": "assets/javalogo.png",
            "startDate": "25 Oct 2025",
            "description":
            "A beginner-friendly guide to Java — from syntax to automation projects."
          },
        ];
        filteredCourses = allCourses;
      }
      );
    }
    );
  }

  // Function to filter courses based on search text
  void filterCourses(String query) {
    final results = allCourses.where((course) {
      final title = course["title"]!.toLowerCase();
      final instructor = course["instructor"]!.toLowerCase();
      final input = query.toLowerCase();
      return title.contains(input) || instructor.contains(input);
    }).toList();

    setState(() => filteredCourses = results);
  }


  @override
  Widget build(BuildContext context) {
   // Size size = MediaQuery.of(context).size;
   // double w = MediaQuery.of(context).size.width;
   // double h = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Theme.of(context).primaryColor ,
      appBar:
      PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          title: const Align(
            alignment: Alignment(0, 0.6),
            child: const Text("Choose Your Courses",
              style: TextStyle(
                color: Colors.white,   // 👈 title color
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          actions: [
            IconButton(
              onPressed: () {
                print('Logo clicked!');
              },
              icon: Image.asset('assets/eceleratelogo.png',
                height: 50, // 👈 control height
                width: 50,  // 👈 control width
              ),
            ),
          ],

          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.tealAccent, Colors.teal],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          elevation: 0.0,
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white ,
            ),
          ),
        ),
      ),
      // backgroundColor: Theme.of(context).primaryColor ,




      body:
      isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
          children: [
      // 🔍 Search Bar
      Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        controller: searchController,
        onChanged: filterCourses,
        decoration: InputDecoration(
          hintText: "Search courses...",
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.grey.shade100,
          contentPadding:
          const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    ),
            // 2️⃣ Suggested Courses Text
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

           // SizedBox(height: 20,),

            // 📋 Course List
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
                          builder: (_) =>
                              CourseDetailsPage(course: course),
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
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
                              course["image"]!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    course["title"]!,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Instructor: ${course["instructor"]}",
                                    style: const TextStyle(
                                        color: Colors.grey),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Start Date: ${course["startDate"]?? "Coming Soon"}",
                                    style: const TextStyle(
                                        color: Colors.grey),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    course["description"]!,
                                    style: const TextStyle(
                                        color: Colors.grey),
                                  ),
                                  const SizedBox(height: 10),
                                  const Row(
                                    children: [
                                      Icon(Icons.star,
                                          color: Colors.amber,
                                          size: 18),
                                      Icon(Icons.star,
                                          color: Colors.amber,
                                          size: 18),
                                      Icon(Icons.star,
                                          color: Colors.amber,
                                          size: 18),
                                      Icon(Icons.star_half,
                                          color: Colors.amber,
                                          size: 18),
                                      Icon(Icons.star_border,
                                          color: Colors.amber,
                                          size: 18),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
      ),


    );
  }
}

