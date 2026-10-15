import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool hidePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Log In')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Icon(Icons.landscape, size: 75, color: AppColors.green),
          const Text('Welcome Back!', textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.navy)),
          const SizedBox(height: 28),
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: const Icon(Icons.email_outlined),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
            ),
          ),
          const SizedBox(height: 18),
          TextField(
            controller: passwordController,
            obscureText: hidePassword,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(hidePassword ? Icons.visibility : Icons.visibility_off),
                onPressed: () => setState(() => hidePassword = !hidePassword),
              ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
            ),
          ),
          const SizedBox(height: 24),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: AppColors.green, minimumSize: const Size.fromHeight(54)),
            onPressed: () {
              if (emailController.text.trim().isEmpty || passwordController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please enter your email and password')),
                );
                return;
              }
              Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (_) => const HomeScreen()), (route) => false);
            },
            child: const Text('Log In'),
          ),
          TextButton(
            onPressed: () => Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (_) => const HomeScreen()), (route) => false),
            child: const Text('Explore without logging in'),
          ),
        ],
      ),
    );
  }
}
