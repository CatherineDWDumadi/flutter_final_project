
import 'package:flutter/material.dart';
import 'login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.eco_rounded,
                size: 70,
                color: Color(0xFF315C55),
              ),

              const SizedBox(height: 32),

              Text(
                'Start your journey',
                style: Theme.of(context).textTheme.headlineLarge,
              ),

              const SizedBox(height: 12),

              Text(
                'Every small step brings you closer '
                'to a smoke-free life.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text('Start your journey'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

