
import 'package:flutter/material.dart';
import 'progress_data.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {

  // EDIT DIARY ENTRY
  void editEntry(int index) {
    final controller = TextEditingController(
      text: ProgressData.diaryEntries[index].reflection,
    );

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Edit Diary Entry'),
          content: TextField(
            controller: controller,
            maxLines: 5,
            decoration: const InputDecoration(
              hintText: 'Edit your reflection...',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final newText = controller.text.trim();

                if (newText.isEmpty) {
                  return;
                }

                setState(() {
                  ProgressData.diaryEntries[index].reflection =
                      newText;
                });

                Navigator.pop(dialogContext);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    ).then((_) {
      controller.dispose();
    });
  }

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
                        // DATE
                        Text(
                          '${entry.date.day}/'
                          '${entry.date.month}/'
                          '${entry.date.year}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        // DIARY REFLECTION
                        Text(entry.reflection),

                        const SizedBox(height: 12),

                        // EDIT BUTTON
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton.icon(
                            onPressed: () {
                              editEntry(index);
                            },
                            icon: const Icon(Icons.edit),
                            label: const Text('Edit'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
