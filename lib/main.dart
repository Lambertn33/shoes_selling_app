import 'package:flutter/material.dart';
import 'package:shoes_app_ui/screens/homepage.dart';
import 'package:shoes_app_ui/screens/login.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFcEDDEE)
      ),
      routes: {
        "/" :  (context) => const LoginPage(),
        "homepage": (context) => const HomePage()
      },
    );
  }
}