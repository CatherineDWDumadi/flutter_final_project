
import 'package:flutter/material.dart';
import 'home_screen.dart';

class QuestionnaireScreen extends StatefulWidget {
  final String username;
  final String quittingGoal;
  final DateTime? targetDate;

  const QuestionnaireScreen({
    super.key,
    required this.username,
    required this.quittingGoal,
    required this.targetDate,
  });

  @override
  State<QuestionnaireScreen> createState() =>
      _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  String? smokingFrequency;
  String? cigarettesPerDay;
  String? smokingDuration;
  String? mainTrigger;

  final List<String> frequencyOptions = [
    'Every day',
    'A few times a week',
    'Rarely',
  ];

  final List<String> amountOptions = [
    '1–5 cigarettes',
    '6–10 cigarettes',
    'More than 10 cigarettes',
  ];

  final List<String> durationOptions = [
    'Less than a year',
    '1–5 years',
    'More than 5 years',
  ];

  final List<String> triggerOptions = [
    'Stress or anxiety',
    'Social situations',
    'Boredom',
    'Other',
  ];

  Widget buildQuestion({
    required String title,
    required String? selectedValue,
    required List<String> options,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),

        ...options.map((option) {
          return RadioListTile<String>(
            title: Text(option),
            value: option,
            groupValue: selectedValue,
            onChanged: onChanged,
            contentPadding: EdgeInsets.zero,
            activeColor: const Color(0xFF315C55),
          );
        }),

        const SizedBox(height: 16),
      ],
    );
  }

  void submitQuestionnaire() {
    if (smokingFrequency == null ||
        cigarettesPerDay == null ||
        smokingDuration == null ||
        mainTrigger == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please answer all questions first.'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(
          username: widget.username,
          quittingGoal: widget.quittingGoal,
          targetDate: widget.targetDate,
          smokingFrequency: smokingFrequency!,
          cigarettesPerDay: cigarettesPerDay!,
          smokingDuration: smokingDuration!,
          mainTrigger: mainTrigger!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Short Questionnaire'),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Let’s get to know you!',
                style: Theme.of(context).textTheme.headlineLarge,
              ),

              const SizedBox(height: 12),

              const Text(
                'Answer a few questions so we can personalize '
                'your smoke-free journey.',
              ),

              const SizedBox(height: 30),

              buildQuestion(
                title: '1. How often do you smoke?',
                selectedValue: smokingFrequency,
                options: frequencyOptions,
                onChanged: (value) {
                  setState(() {
                    smokingFrequency = value;
                  });
                },
              ),

              buildQuestion(
                title: '2. How many cigarettes do you usually smoke per day?',
                selectedValue: cigarettesPerDay,
                options: amountOptions,
                onChanged: (value) {
                  setState(() {
                    cigarettesPerDay = value;
                  });
                },
              ),

              buildQuestion(
                title: '3. How long have you been smoking?',
                selectedValue: smokingDuration,
                options: durationOptions,
                onChanged: (value) {
                  setState(() {
                    smokingDuration = value;
                  });
                },
              ),

              buildQuestion(
                title: '4. What is your main smoking trigger?',
                selectedValue: mainTrigger,
                options: triggerOptions,
                onChanged: (value) {
                  setState(() {
                    mainTrigger = value;
                  });
                },
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: submitQuestionnaire,
                  child: const Text('Finish'),
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
