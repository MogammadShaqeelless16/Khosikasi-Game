import 'package:flutter/material.dart';
import 'package:flame_audio/flame_audio.dart';
import '../data/slide_data.dart';
import '../widgets/slide_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    FlameAudio.bgm.play('sound/intro.mp3'); // Play background music for intro
  }

  void _playMenuSound() {
    FlameAudio.bgm.stop(); // Stop the intro sound
    FlameAudio.play('sound/menu.mp3'); // Play the menu transition sound
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: slides.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return SlideWidget(slide: slides[index]);
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.brown[800],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _currentIndex == 0
                ? const SizedBox(width: 60)
                : TextButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
            Row(
              children: List.generate(
                slides.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Colors.orange
                        : Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            _currentIndex == slides.length - 1
                ? TextButton(
                    onPressed: () {
                      _playMenuSound(); // Play sound for menu
                      Navigator.pushReplacementNamed(context, '/mainMenu');
                    },
                    child: const Text(
                      'Start',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : TextButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    FlameAudio.bgm.stop(); // Stop any playing audio when disposing
    _pageController.dispose();
    super.dispose();
  }
}
