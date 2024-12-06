import 'package:flutter/material.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy lesson list
    final List<String> lessons = [
      'Lesson 1: Basics of Entrepreneurship',
      'Lesson 2: Setting Up Your Business',
      'Lesson 3: Managing Finances',
      'Lesson 4: Marketing Strategies',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lessons'),
        backgroundColor: Colors.brown[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: lessons.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(lessons[index]),
              leading: const Icon(Icons.book),
            );
          },
        ),
      ),
    );
  }
}
