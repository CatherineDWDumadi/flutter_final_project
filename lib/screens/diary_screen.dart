import 'package:flutter/material.dart';
import 'progress_data.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  @override
  Widget build(BuildContext context) {
    final entries = ProgressData.diaryEntries;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Diary'),
      ),
      body: entries.isEmpty
          ? const Center(
              child: Text('No diary entries yet.'),
            )
          : ListView.builder(
              itemCount: entries.length,
              itemBuilder: (context, index) {
                final entry = entries[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${entry.date.day}/'
                          '${entry.date.month}/'
                          '${entry.date.year}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(entry.reflection),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}