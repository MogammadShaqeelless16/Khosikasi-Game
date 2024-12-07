import 'package:flutter/material.dart';

class SunriseAnimation extends StatefulWidget {
  const SunriseAnimation({super.key});

  @override
  _SunriseAnimationState createState() => _SunriseAnimationState();
}

class _SunriseAnimationState extends State<SunriseAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>().animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(seconds: 3),
      bottom: 0,
      left: 0,
      right: 0,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Glowing halo effect
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.yellow.withOpacity(0.3),
                    Colors.transparent,
                  ],
                  stops: const [0.6, 1.0],
                ),
              ),
            ),
            // Main sun
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Colors.orange.shade300,
                    Colors.yellow.shade700,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.yellow.shade700.withOpacity(0.5),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
            ),
            // Sun icon overlay
            const Icon(
              Icons.wb_sunny,
              color: Colors.white,
              size: 60,
            ),
          ],
        ),
      ),
    );
  }
}
