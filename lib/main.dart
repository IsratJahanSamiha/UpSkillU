import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_provider.dart';
import 'login.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
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
      theme: ThemeData(
        primaryColor: const Color(0xFFA5A6F6),
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      debugShowCheckedModeBanner: false,
      home:LogIn(),
    );
  }
}
