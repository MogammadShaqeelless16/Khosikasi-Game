import 'package:flutter/material.dart';

class AvatarCreationScreen extends StatefulWidget {
  const AvatarCreationScreen({super.key});

  @override
  _AvatarCreationScreenState createState() => _AvatarCreationScreenState();
}

class _AvatarCreationScreenState extends State<AvatarCreationScreen> {
  final TextEditingController _nameController = TextEditingController();
  String? avatarChoice = 'Male'; // Just for demonstration, can be extended

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Your Avatar'),
        backgroundColor: Colors.brown[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Enter your Name',
              ),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: avatarChoice,
              items: <String>['Male', 'Female', 'Custom']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  avatarChoice = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save avatar and name (could be in shared_preferences)
                Navigator.pop(context);
              },
              child: const Text('Save Avatar'),
            ),
          ],
        ),
      ),
    );
  }
}
