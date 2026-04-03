import 'package:flutter/material.dart';
import 'package:gigchill/views/screens/dashboard_screen.dart';
import 'package:gigchill/views/screens/question_screen.dart';
import 'package:gigchill/views/screens/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GigChill',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Nunito',
        scaffoldBackgroundColor: const Color(0xFFF0F4F0),
      ),
      home: const DashboardScreen(),
    );
  }
}