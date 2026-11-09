
import 'package:flutter/material.dart';

class TipDetailScreen extends StatelessWidget {
  final String title;
  final String category;
  final String description;

  const TipDetailScreen({
    super.key,
    required this.title,
    required this.category,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.lightbulb,
              size: 60,
              color: Color(0xFF315C55),
            ),

            const SizedBox(height: 24),

            Text(
              category.toUpperCase(),
              style: const TextStyle(
                color: Color(0xFF315C55),
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge,
            ),

            const SizedBox(height: 20),

            Text(
              description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back to Tips'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
