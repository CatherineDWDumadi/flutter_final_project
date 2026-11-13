
import 'package:material_ui/material_ui.dart';
import 'progress_data.dart';

class ReflectionScreen extends StatefulWidget {
  const ReflectionScreen({super.key});

  @override
  State<ReflectionScreen> createState() => _ReflectionScreenState();
}

class _ReflectionScreenState extends State<ReflectionScreen> {

  void editReflection(int index) {
    final controller = TextEditingController(
      text: ProgressData.diaryEntries[index].reflection,
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Reflection'),
        content: TextField(
          controller: controller,
          maxLines: 5,
          decoration: const InputDecoration(
            hintText: 'Update your reflection...',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              controller.dispose();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.trim().isEmpty) return;

              setState(() {
                ProgressData.diaryEntries[index].reflection =
                    controller.text.trim();
              });

              Navigator.pop(context);
              controller.dispose();
            },
            child: const Text('Save Changes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final entries = ProgressData.diaryEntries;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Reflections'),
      ),
      body: entries.isEmpty
          ? const Center(
              child: Text('No reflections yet.'),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: entries.length,
              itemBuilder: (context, index) {
                final entry = entries[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    title: Text(entry.reflection),
                    subtitle: Text(
                      '${entry.date.day}/${entry.date.month}/${entry.date.year}',
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => editReflection(index),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
