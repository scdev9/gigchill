import 'package:flutter/material.dart';
import 'dart:async';
import 'question_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const Color _bgColor = Color(0xFFEDEDED);
  static const Color _green = Color(0xFF1F8F5F);
  static const Color _darkText = Color(0xFF1A2E1A);

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  /// 🔥 MAIN LOGIC
  Future<void> _initializeApp() async {
    /// ⏱ Minimum splash time
    final minDelay = Future.delayed(const Duration(seconds: 4));

    /// 📡 Your app loading (API, DB, cache, etc.)
    final appLoad = _loadAppData();

    /// ⏳ Wait for BOTH to complete
    await Future.wait([minDelay, appLoad]);

    /// 🚀 Navigate safely
    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const QuestionScreen(),
      ),
    );
  }

  /// 📡 Replace this with your real loading logic
  Future<void> _loadAppData() async {
    // Example:
    // await fetchUserData();
    // await loadSettings();
    // await initDatabase();

    await Future.delayed(const Duration(seconds: 1)); // simulate API
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: _green,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: _green.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Icon(
                Icons.ac_unit,
                color: Colors.white,
                size: 40,
              ),
            ),

            const SizedBox(height: 30),

            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "GIG",
                    style: TextStyle(
                      color: _darkText,
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  TextSpan(
                    text: "CHILL",
                    style: TextStyle(
                      color: _green,
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}