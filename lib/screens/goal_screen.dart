
import 'package:flutter/material.dart';
import 'questionnaire_screen.dart';

class GoalScreen extends StatefulWidget {
  final String username;

  const GoalScreen({
    super.key,
    required this.username,
  });

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  String selectedGoal = 'As soon as possible';
  DateTime? targetDate;

  Future<void> chooseDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(
        const Duration(days: 7),
      ),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );

    if (picked != null) {
      setState(() {
        targetDate = picked;
        selectedGoal = 'Choose a target date';
      });
    }
  }

  void continueToQuestionnaire() {
    if (selectedGoal == 'Choose a target date' &&
        targetDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select your target date.'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuestionnaireScreen(
          username: widget.username,
          quittingGoal: selectedGoal,
          targetDate: targetDate,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Your Goal'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Set your quitting goal',
                style: Theme.of(context).textTheme.headlineLarge,
              ),

              const SizedBox(height: 12),

              const Text(
                'Setting a goal can help you stay focused '
                'and track your progress.',
              ),

              const SizedBox(height: 30),

              RadioGroup<String>(
                groupValue: selectedGoal,
                onChanged: (value) {
                  setState(() {
                    selectedGoal = value!;
                    if (selectedGoal == 'As soon as possible') {
                      targetDate = null;
                    }
                  });
                },
                child: const Column(
                  children: [
                    RadioListTile<String>(
                      title: Text('As soon as possible'),
                      value: 'As soon as possible',
                    ),
                    RadioListTile<String>(
                      title: Text('Choose a target date'),
                      value: 'Choose a target date',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              OutlinedButton.icon(
                onPressed: chooseDate,
                icon: const Icon(Icons.calendar_month),
                label: Text(
                  targetDate == null
                      ? 'Select target date'
                      : '${targetDate!.day}/${targetDate!.month}/${targetDate!.year}',
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: continueToQuestionnaire,
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
