import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy task list
    final List<String> tasks = [
      'Task 1: Research your business idea.',
      'Task 2: Create a business plan.',
      'Task 3: Set up your workspace.',
      'Task 4: Design your brand.',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Tasks'),
        backgroundColor: Colors.brown[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(tasks[index]),
              leading: const Icon(Icons.check_circle_outline),
            );
          },
        ),
      ),
    );
  }
}
