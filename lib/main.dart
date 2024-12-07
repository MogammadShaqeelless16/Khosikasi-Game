import 'package:flutter/material.dart';
import 'screens/onboarding_screen.dart';
import 'screens/main_menu_screen.dart';
import 'screens/avatar_creation_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/tasks_screen.dart';
import 'screens/lessons_screen.dart'; 

void main() {
  runApp(KhosikasiApp());
}

class KhosikasiApp extends StatelessWidget {
  const KhosikasiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Khosikasi',
      theme: ThemeData(
        primaryColor: Colors.brown[800],
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.orange[600]),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => OnboardingScreen(),
        '/mainMenu': (context) => const MainMenuScreen(),
        '/avatarCreation': (context) => const AvatarCreationScreen(),
        '/tasks': (context) => const TasksScreen(),
        '/lessons': (context) => const LessonsScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
