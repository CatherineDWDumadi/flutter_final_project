
import 'package:flutter/material.dart';

class SupportDetailScreen extends StatelessWidget {
  final String title;
  final String description;

  const SupportDetailScreen({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.favorite,
              size: 56,
              color: Color(0xFF315C55),
            ),

            const SizedBox(height: 24),

            Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge,
            ),

            const SizedBox(height: 16),

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
                child: const Text('Back to Support'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
