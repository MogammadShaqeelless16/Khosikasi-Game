import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double _volume = 0.5; // Initial volume value, from 0.0 to 1.0

  // This function can be modified to change the audio player's volume
  void _setVolume(double value) {
    setState(() {
      _volume = value;
    });
    // If you are using a specific audio player package, set the volume here
    // For example, if using audioplayers, you could do:
    // AudioPlayer().setVolume(_volume);
    print("Volume set to: $_volume");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.brown[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Adjust Volume',
              style: TextStyle(fontSize: 24),
            ),
            Slider(
              value: _volume,
              min: 0.0,
              max: 1.0,
              onChanged: _setVolume,
              divisions: 10,
              label: (_volume * 100).toStringAsFixed(0) + '%',
            ),
            Text(
              'Volume: ${(_volume * 100).toStringAsFixed(0)}%',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the main menu
              },
              child: const Text('Back to Main Menu'),
            ),
          ],
        ),
      ),
    );
  }
}
