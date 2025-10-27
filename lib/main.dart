import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upskillu/home.dart';
import 'auth_provider.dart';
import 'login.dart';
import 'signup.dart';
import 'feedback_provider.dart';



void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => FeedbackProvider()),
      ],
      child: UpSkillUApp(),
    ),
  );
}

/*
void main() {
  runApp(UpSkillUApp());
}

class UpSkillUApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home:Course(),
    );
  }
}
*/

class UpSkillUApp extends StatelessWidget {
  const UpSkillUApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UpSkillU',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFA5A6F6),
        scaffoldBackgroundColor: Colors.grey[200],
      ),

        initialRoute: '/login',
        routes: {
          '/login': (context) => const LogIn(),
          '/signup': (context) => const SignUp(),
          '/home': (context) => const HomePage(),
        },

    );
  }
}
