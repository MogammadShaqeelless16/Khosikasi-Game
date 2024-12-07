import 'package:flutter/material.dart';

class PlantGrowthAnimation extends StatelessWidget {
  const PlantGrowthAnimation({super.key});

  @override
  Widget build(BuildContext context) {
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
