import 'progress_data.dart';
import 'package:flutter/material.dart';

class DailyCheckInScreen extends StatefulWidget {
  const DailyCheckInScreen({super.key});

  @override
  State<DailyCheckInScreen> createState() =>
      _DailyCheckInScreenState();
}

class _DailyCheckInScreenState extends State<DailyCheckInScreen> {
  int currentStep = 0;

  String? selectedFeeling;
  String? smokedToday;
  String? selectedReason;

  final TextEditingController diaryController =
      TextEditingController();

  final List<String> feelings = [
    'Great',
    'Good',
    'Okay',
    'Not great',
    'Struggling',
  ];

  final List<String> helpfulActivities = [
    'Exercise',
    'Drinking water',
    'Keeping myself busy',
    'Relaxing or meditating',
    'Other',
  ];

  final List<String> smokingReasons = [
    'Stress or anxiety',
    'Social situations',
    'Boredom',
    'Other',
  ];

  void nextStep() {
    if (currentStep == 0 && selectedFeeling == null) {
      showMessage('Please select how you feel.');
      return;
    }

    if (currentStep == 1 && smokedToday == null) {
      showMessage('Please select an answer.');
      return;
    }

    if (currentStep == 2 && selectedReason == null) {
      showMessage('Please select an option.');
      return;
    }

    if (currentStep == 3 &&
        diaryController.text.trim().isEmpty) {
      showMessage('Please write a short reflection.');
      return;
    }

    if (currentStep < 3) {
      setState(() {
        currentStep++;
      });
    } else {
    // Save reflection as a new diary entry
    ProgressData.diaryEntries.add(
      DiaryEntry(
        reflection: diaryController.text.trim(),
        date: DateTime.now(),
      ),
    );

    // Update check-in progress
    ProgressData.completeCheckIn();

    showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Check-in Completed!'),
      content: const Text(
        'Thank you for checking in today. '
        'Every step counts!',
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: const Text('Done'),
        ),
      ],
    ),
  );
}
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Widget buildOptions({
    required List<String> options,
    required String? selectedValue,
    required Function(String) onSelected,
  }) {
    return Column(
      children: options.map((option) {
        return RadioListTile<String>(
          title: Text(option),
          value: option,
          groupValue: selectedValue,
          activeColor: const Color(0xFF315C55),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                onSelected(value);
              });
            }
          },
        );
      }).toList(),
    );
  }

  @override
  void dispose() {
    diaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Check-In'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Step ${currentStep + 1} of 4',
                style: const TextStyle(
                  color: Color(0xFF315C55),
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              LinearProgressIndicator(
                value: (currentStep + 1) / 4,
                color: const Color(0xFF315C55),
                backgroundColor: const Color(0xFFE0E8E4),
              ),

              const SizedBox(height: 32),

              if (currentStep == 0) ...[
                Text(
                  'How are you feeling today?',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                buildOptions(
                  options: feelings,
                  selectedValue: selectedFeeling,
                  onSelected: (value) {
                    selectedFeeling = value;
                  },
                ),
              ],

              if (currentStep == 1) ...[
                Text(
                  'Did you smoke today?',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                buildOptions(
                  options: ['No', 'Yes'],
                  selectedValue: smokedToday,
                  onSelected: (value) {
                    smokedToday = value;
                  },
                ),
              ],

              if (currentStep == 2) ...[
                Text(
                  smokedToday == 'No'
                      ? 'What helped you today?'
                      : 'What influenced your choice today?',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                buildOptions(
                  options: smokedToday == 'No'
                      ? helpfulActivities
                      : smokingReasons,
                  selectedValue: selectedReason,
                  onSelected: (value) {
                    selectedReason = value;
                  },
                ),
              ],

              if (currentStep == 3) ...[
                Text(
                  'Daily Reflection',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Write down anything you would like '
                  'to remember about today.',
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: diaryController,
                  maxLines: 6,
                  decoration: const InputDecoration(
                    hintText: 'Write your thoughts here...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],

              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: nextStep,
                  child: Text(
                    currentStep == 3 ? 'Finish' : 'Continue',
                  ),
                ),
              ),

              if (currentStep > 0) ...[
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        currentStep--;
                      });
                    },
                    child: const Text('Back'),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
