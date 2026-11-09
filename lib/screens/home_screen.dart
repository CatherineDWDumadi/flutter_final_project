
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String username;
  final String quittingGoal;
  final DateTime? targetDate;
  final String smokingFrequency;
  final String cigarettesPerDay;
  final String smokingDuration;
  final String mainTrigger;

  const HomeScreen({
    super.key,
    required this.username,
    required this.quittingGoal,
    required this.targetDate,
    required this.smokingFrequency,
    required this.cigarettesPerDay,
    required this.smokingDuration,
    required this.mainTrigger,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smoke Free'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.account_circle, size: 30),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, $username!',
                style: Theme.of(context).textTheme.headlineLarge,
              ),

              const SizedBox(height: 8),

              const Text(
                'Every step forward matters. Keep going!',
              ),

              const SizedBox(height: 28),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF315C55),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.eco_rounded,
                      color: Colors.white,
                      size: 48,
                    ),

                    SizedBox(height: 16),

                    Text(
                      'Your smoke-free journey starts here!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      'Small steps can make a meaningful difference.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              Text(
                'Your quitting goal',
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(height: 12),

              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.flag_rounded,
                    color: Color(0xFF315C55),
                  ),
                  title: Text(quittingGoal),
                  subtitle: Text(
                    targetDate == null
                        ? 'No specific target date'
                        : 'Target: ${targetDate!.day}/${targetDate!.month}/${targetDate!.year}',
                  ),
                ),
              ),

              const SizedBox(height: 28),

              Text(
                'Your dashboard',
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(height: 12),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.show_chart),
                  title: const Text('Progress Tracker'),
                  subtitle: const Text('Follow your progress'),
                ),
              ),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: const Text('Daily Check-In'),
                  subtitle: const Text('Reflect on your day'),
                ),
              ),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.local_fire_department),
                  title: const Text('Your Streak'),
                  subtitle: const Text('Celebrate your milestones'),
                ),
              ),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.lightbulb_outline),
                  title: const Text('Tips'),
                  subtitle: const Text('Explore helpful information'),
                ),
              ),

              Card(
                child: ListTile(
                  leading: const Icon(Icons.support_agent),
                  title: const Text('Support'),
                  subtitle: const Text('Find encouragement and support'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
