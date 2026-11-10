
import 'package:flutter/material.dart';
import 'support_detail_screen.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  final List<Map<String, String>> supportOptions = const [
    {
      'title': 'You Are Not Alone',
      'subtitle': 'Find encouragement and support',
      'icon': 'people',
      'description':
          'Making a lifestyle change can be challenging. '
          'You do not have to face it alone. Talk to someone '
          'you trust, such as a friend, family member, or '
          'healthcare professional. Having someone listen '
          'and encourage you can make difficult days easier.',
    },
    {
      'title': 'Learn About Nicotine',
      'subtitle': 'Understand cravings and habits',
      'icon': 'book',
      'description':
          'Nicotine can cause dependence, which may make '
          'quitting challenging. Learning about cravings '
          'and common triggers can help you prepare for '
          'difficult moments. A healthcare professional '
          'can help you explore appropriate support options.',
    },
    {
      'title': 'Build Healthy Routines',
      'subtitle': 'Create positive daily habits',
      'icon': 'heart',
      'description':
          'Try building routines that support your well-being. '
          'You could take a walk, enjoy a hobby, listen to music, '
          'or spend time with people who encourage you. '
          'Choose activities that feel manageable for you.',
    },
    {
      'title': 'Ask for Professional Help',
      'subtitle': 'Know when to seek guidance',
      'icon': 'medical',
      'description':
          'A doctor or qualified healthcare professional can '
          'provide reliable information and discuss support '
          'options for quitting smoking. You can ask questions '
          'and find an approach that suits your needs.',
    },
  ];

  IconData getIcon(String name) {
    switch (name) {
      case 'people':
        return Icons.people_outline;
      case 'book':
        return Icons.menu_book_outlined;
      case 'heart':
        return Icons.favorite_border;
      case 'medical':
        return Icons.health_and_safety_outlined;
      default:
        return Icons.info_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF315C55),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.volunteer_activism,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'You Are Stronger Than You Think.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Every journey is different. '
                    'Take your time, ask for support, '
                    'and celebrate every step forward.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            Text(
              'Explore Support',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 8),

            const Text(
              'Helpful information for your journey.',
            ),

            const SizedBox(height: 16),

            ...supportOptions.map((option) {
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(14),
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xFFE4EDE9),
                    child: Icon(
                      getIcon(option['icon']!),
                      color: const Color(0xFF315C55),
                    ),
                  ),
                  title: Text(
                    option['title']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(option['subtitle']!),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SupportDetailScreen(
                          title: option['title']!,
                          description: option['description']!,
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
