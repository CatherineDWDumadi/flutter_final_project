
import 'package:flutter/material.dart';
import 'tip_detail_screen.dart';

class TipsScreen extends StatefulWidget {
  const TipsScreen({super.key});

  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  final TextEditingController searchController =
      TextEditingController();

  String selectedCategory = 'All';

  final List<Map<String, String>> tips = [
    {
      'title': 'Understand Your Triggers',
      'category': 'Mindset',
      'description':
          'Recognize situations, emotions, or routines that make you want to smoke. Understanding your triggers can help you prepare healthier responses.',
    },
    {
      'title': 'Stay Hydrated',
      'category': 'Healthy Habits',
      'description':
          'Drinking enough water throughout the day supports your general well-being. Keep a water bottle nearby as a helpful daily habit.',
    },
    {
      'title': 'Try a Short Walk',
      'category': 'Healthy Habits',
      'description':
          'A short walk can help shift your attention and give you a change of environment when you feel stressed or restless.',
    },
    {
      'title': 'Manage Stress',
      'category': 'Cravings',
      'description':
          'When you feel stressed, try slow breathing, listening to music, or talking to someone you trust.',
    },
    {
      'title': 'Celebrate Small Progress',
      'category': 'Mindset',
      'description':
          'Every positive step matters. Recognize your progress and remember that building a new habit takes time.',
    },
    {
      'title': 'Reach Out for Support',
      'category': 'Cravings',
      'description':
          'You do not have to handle difficult moments alone. Consider talking to a trusted person or a healthcare professional.',
    },
  ];

  final List<String> categories = [
    'All',
    'Mindset',
    'Healthy Habits',
    'Cravings',
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredTips = tips.where((tip) {
      final matchesCategory = selectedCategory == 'All' ||
          tip['category'] == selectedCategory;

      final matchesSearch = tip['title']!
              .toLowerCase()
              .contains(searchController.text.toLowerCase()) ||
          tip['description']!
              .toLowerCase()
              .contains(searchController.text.toLowerCase());

      return matchesCategory && matchesSearch;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tips & Information'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Learn Something New',
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(height: 8),

              const Text(
                'Explore helpful ideas for your smoke-free journey.',
              ),

              const SizedBox(height: 20),

              // SEARCH BAR
              TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  hintText: 'Search tips...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // CATEGORIES
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.map((category) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(category),
                        selected: selectedCategory == category,
                        onSelected: (selected) {
                          setState(() {
                            selectedCategory = category;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 20),

              // TIPS LIST
              const Text(
                'Helpful Tips',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Expanded(
                child: filteredTips.isEmpty
                    ? const Center(
                        child: Text('No tips found.'),
                      )
                    : ListView.builder(
                        itemCount: filteredTips.length,
                        itemBuilder: (context, index) {
                          final tip = filteredTips[index];

                          return Card(
                            margin: const EdgeInsets.only(bottom: 12),
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.all(14),
                              leading: const CircleAvatar(
                                backgroundColor: Color(0xFFE4EDE9),
                                child: Icon(
                                  Icons.lightbulb_outline,
                                  color: Color(0xFF315C55),
                                ),
                              ),
                              title: Text(
                                tip['title']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(tip['category']!),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        TipDetailScreen(
                                      title: tip['title']!,
                                      category: tip['category']!,
                                      description:
                                          tip['description']!,
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
