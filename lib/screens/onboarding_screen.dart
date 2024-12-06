import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _slides = [
    {
      'backgroundColor': Colors.brown[200],
      'title': 'Welcome to Khosikasi!',
      'description':
          'A journey to entrepreneurship begins with one step. Let’s build your dream together.',
      'sunrise': true,
      'plantGrowth': false,
    },
    {
      'backgroundColor': Colors.orange[200],
      'title': 'Dream Big, Start Small',
      'description': 'Every vision starts small. Let’s grow yours!',
      'sunrise': false,
      'plantGrowth': true,
    },
    {
      'backgroundColor': Colors.green[300],
      'title': 'Let’s Build Together',
      'description': 'Achieve your goals and make your mark on the world!',
      'sunrise': false,
      'plantGrowth': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: _slides.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          final slide = _slides[index];
          return Container(
            color: slide['backgroundColor'],
            child: Stack(
              children: [
                // Background animations
                if (slide['sunrise']) _buildSunriseAnimation(),
                if (slide['plantGrowth']) _buildPlantGrowthAnimation(),

                // Content
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        slide['title'],
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: SizedBox(
                        width: double.infinity,
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                            fontStyle: FontStyle.italic,
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(slide['description']),
                            ],
                            isRepeatingAnimation: false,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
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
                _slides.length,
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
            _currentIndex == _slides.length - 1
                ? TextButton(
                    onPressed: () {
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

  // Sun Rising Animation
  Widget _buildSunriseAnimation() {
    return AnimatedPositioned(
      duration: const Duration(seconds: 3),
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.yellow[700],
        ),
        child: const Center(
          child: Icon(
            Icons.wb_sunny,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
    );
  }

  // Plant Growing Animation
  Widget _buildPlantGrowthAnimation() {
    return AnimatedSize(
      duration: const Duration(seconds: 3),
      curve: Curves.easeInOut,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 50,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.green[700],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.nature,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
