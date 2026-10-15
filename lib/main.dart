import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const TrekNepalApp());
}

class TrekNepalApp extends StatelessWidget {
  const TrekNepalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TrekNepal',
      theme: AppTheme.light,
      home: const WelcomeScreen(),
    );
  }
}
