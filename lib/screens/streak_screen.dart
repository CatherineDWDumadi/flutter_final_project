
import 'package:flutter/material.dart';
import 'progress_data.dart';

class StreakScreen extends StatefulWidget {
  const StreakScreen({super.key});

  @override
  State<StreakScreen> createState() => _StreakScreenState();
}

class _StreakScreenState extends State<StreakScreen> {
  final List<int> milestones = [3, 7, 14, 30, 60, 100];

  int get nextMilestone {
    return milestones.firstWhere(
      (milestone) => milestone > ProgressData.streakDays,
      orElse: () => 100,
    );
  }

  @override
  void initState() {
    super.initState();
    refreshProgress();
  }

  void refreshProgress() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Streak'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Keep Your Momentum!',
                style: Theme.of(context).textTheme.headlineLarge,
              ),

              const SizedBox(height: 24),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFF315C55),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.local_fire_department,
                      color: Colors.white,
                      size: 48,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '${ProgressData.streakDays}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Consecutive days',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: buildStatCard(
                      'Total Check-ins',
                      '${ProgressData.totalCheckIns}',
                      Icons.check_circle_outline,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: buildStatCard(
                      'Next Milestone',
                      '$nextMilestone days',
                      Icons.flag_outlined,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              const Text(
                'Daily Activity',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Card(
                child: ListTile(
                  leading: Icon(
                    ProgressData.checkedInToday
                        ? Icons.check_circle
                        : Icons.circle_outlined,
                    color: const Color(0xFF315C55),
                  ),
                  title: const Text('Today'),
                  subtitle: Text(
                    ProgressData.checkedInToday
                        ? 'Check-in completed'
                        : 'No check-in yet',
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Center(
                child: Text(
                  'Every day is a new opportunity to make progress.',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStatCard(
    String title,
    String value,
    IconData icon,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(
              icon,
              color: const Color(0xFF315C55),
              size: 28,
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
