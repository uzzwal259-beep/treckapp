import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../utils/app_constants.dart';
import '../widgets/mountain_image.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          MountainImage(AppConstants.everestImage),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xAA07518B), Color(0x2230475C), Color(0xEE06131C)],
                stops: [0, .48, 1],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                children: [
                  const SizedBox(height: 75),
                  const Icon(Icons.landscape, color: Colors.white, size: 92),
                  const SizedBox(height: 10),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 39, color: Colors.white, letterSpacing: -1.5),
                      children: [
                        TextSpan(text: 'Trek', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'Nepal'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 17),
                  const Text('Discover  •  Explore  •  Go Further',
                      textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.white)),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.green,
                        foregroundColor: Colors.white,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () => Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) => const HomeScreen())),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Get Started', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                          SizedBox(width: 15),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account? ', style: TextStyle(color: Colors.white)),
                      TextButton(
                        onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const LoginScreen())),
                        child: const Text('Log In', style: TextStyle(color: Color(0xFF40E5CD), fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
