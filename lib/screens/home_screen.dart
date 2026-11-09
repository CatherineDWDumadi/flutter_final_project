import 'streak_screen.dart';
import 'package:flutter/material.dart';

import 'progress_screen.dart';
import 'daily_checkin_screen.dart';

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

  Widget buildMenuCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFE4EDE9),
          child: Icon(
            icon,
            color: const Color(0xFF315C55),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
        ),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smoke Free'),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Welcome to Smoke Free!'),
                ),
              );
            },
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // GREETING
              Text(
                'Hi, $username!',
                style: Theme.of(context).textTheme.headlineLarge,
              ),

              const SizedBox(height: 8),

              const Text(
                'Every small step matters. Keep moving forward!',
              ),

              const SizedBox(height: 24),

              // WELCOME BANNER
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF315C55),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.eco,
                      color: Colors.white,
                      size: 36,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Your smoke-free journey starts here.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Take it one day at a time. '
                      'You are making progress!',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // QUITTING GOAL
              const Text(
                'Your Quitting Goal',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.flag_outlined,
                    color: Color(0xFF315C55),
                  ),
                  title: Text(quittingGoal),
                  subtitle: Text(
                    targetDate == null
                        ? 'Your selected goal'
                        : 'Target date: ${targetDate!.day}/'
                          '${targetDate!.month}/'
                          '${targetDate!.year}',
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // DASHBOARD MENU
              const Text(
                'Your Dashboard',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              // PROGRESS TRACKER
              buildMenuCard(
                context: context,
                icon: Icons.trending_up,
                title: 'Progress Tracker',
                subtitle: 'Track your smoke-free journey',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProgressScreen(
                        username: username,
                        quittingGoal: quittingGoal,
                        targetDate: targetDate,
                      ),
                    ),
                  );
                },
              ),

              // DAILY CHECK-IN
              buildMenuCard(
                context: context,
                icon: Icons.edit_calendar,
                title: 'Daily Check-In',
                subtitle: 'Reflect on your day',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const DailyCheckInScreen(),
                    ),
                  );
                },
              ),

              // STREAK
              buildMenuCard(
                context: context,
                icon: Icons.local_fire_department,
                title: 'Your Streak',
                subtitle: 'View your daily achievements',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StreakScreen(),
                    ),
                  );
                },
              ),
              // TIPS
              buildMenuCard(
                context: context,
                icon: Icons.lightbulb_outline,
                title: 'Tips',
                subtitle: 'Explore helpful information',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Tips page is coming soon!'),
                    ),
                  );
                },
              ),

              // SUPPORT
              buildMenuCard(
                context: context,
                icon: Icons.favorite_border,
                title: 'Support',
                subtitle: 'Find support and encouragement',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Support page is coming soon!'),
                    ),
                  );
                },
              ),

              const SizedBox(height: 24),

              // QUESTIONNAIRE SUMMARY
              const Text(
                'Your Questionnaire Summary',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Smoking frequency: $smokingFrequency'),
                      const Divider(),
                      Text('Amount: $cigarettesPerDay'),
                      const Divider(),
                      Text('Duration: $smokingDuration'),
                      const Divider(),
                      Text('Main trigger: $mainTrigger'),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
