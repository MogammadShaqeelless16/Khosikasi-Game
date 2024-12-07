import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../animations/sunrise_animation.dart';
import '../animations/plant_growth_animation.dart';

class SlideWidget extends StatelessWidget {
  final Map<String, dynamic> slide;

  const SlideWidget({required this.slide, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: slide['backgroundColor'],
      child: Stack(
        children: [
          if (slide['sunrise']) const SunriseAnimation(),
          if (slide['plantGrowth']) const PlantGrowthAnimation(),
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
  }
}
