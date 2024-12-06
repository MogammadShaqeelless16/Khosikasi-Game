import 'package:flutter/material.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Menu'),
        backgroundColor: Colors.brown[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: const Text(
                'Create Avatar',
                style: TextStyle(fontSize: 24),
              ),
              leading: Icon(Icons.person, color: Colors.orange[600]),
              onTap: () {
                Navigator.pushNamed(context, '/avatarCreation');
              },
            ),
            ListTile(
              title: const Text(
                'Daily Tasks',
                style: TextStyle(fontSize: 24),
              ),
              leading: Icon(Icons.check_circle, color: Colors.orange[600]),
              onTap: () {
                Navigator.pushNamed(context, '/tasks');
              },
            ),
            ListTile(
              title: const Text(
                'Lessons',
                style: TextStyle(fontSize: 24),
              ),
              leading: Icon(Icons.school, color: Colors.orange[600]),
              onTap: () {
                Navigator.pushNamed(context, '/lessons');
              },
            ),
          ],
        ),
      ),
    );
  }
}
