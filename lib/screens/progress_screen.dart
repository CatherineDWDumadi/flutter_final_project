
import 'package:flutter/material.dart';

class ProgressScreen extends StatefulWidget {
  final String username;
  final String quittingGoal;
  final DateTime? targetDate;

  const ProgressScreen({
    super.key,
    required this.username,
    required this.quittingGoal,
    required this.targetDate,
  });

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  int smokeFreeDays = 0;
  int completedCheckIns = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Tracker'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Progress',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              Text('Keep going, ${widget.username}!'),
              const SizedBox(height: 30),

              Center(
                child: Container(
                  width: 190,
                  height: 190,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF8EAEA3),
                      width: 12,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$smokeFreeDays',
                        style: const TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF315C55),
                        ),
                      ),
                      const Text('Smoke-free days'),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.calendar_today,
                    color: Color(0xFF315C55),
                  ),
                  title: const Text('Quitting Goal'),
                  subtitle: Text(widget.quittingGoal),
                ),
              ),

              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.check_circle_outline,
                    color: Color(0xFF315C55),
                  ),
                  title: const Text('Completed Check-ins'),
                  trailing: Text(
                    '$completedCheckIns',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'Update your progress',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    smokeFreeDays++;
                  });
                },
                child: const Text('Add Smoke-Free Day'),
              ),

              const SizedBox(height: 12),

              OutlinedButton(
                onPressed: () {
                  setState(() {
                    completedCheckIns++;
                  });
                },
                child: const Text('Complete a Check-in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
