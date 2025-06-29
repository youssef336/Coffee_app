import 'dart:math' as math;

import 'package:coffeapp/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late final AnimationController _mainController;
  late final List<AnimationController> _cupControllers = [];
  late final List<Animation<double>> _scaleAnimations = [];
  late final List<Animation<double>> _circularAnimations = [];
  final int _numberOfCups = 5; // Only one cup for the scale animation
  bool _showScaleAnimation = true;
  bool _showCircularAnimation = false;
  final double _cupSize = 60.0;

  @override
  void initState() {
    super.initState();

    _mainController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              // Hide horizontal animation first
              setState(() {
                _showScaleAnimation = false;
              });

              // After a delay, show circular animation
              Future.delayed(const Duration(seconds: 1), () {
                if (mounted) {
                  setState(() {
                    _showCircularAnimation = true;
                    // Start circular animations
                    for (int i = 0; i < _numberOfCups; i++) {
                      _cupControllers[i * 2 + 1].forward();
                    }
                  });

                  // Navigate to home after circular animation
                  Future.delayed(const Duration(seconds: 8), () {
                    if (mounted) {
                      Navigator.pushReplacementNamed(context, '/home');
                    }
                  });
                }
              });
            }
          });

    // Create animations for each coffee cup
    for (int i = 0; i < _numberOfCups; i++) {
      // Scale controller for smooth pulsing
      final scaleController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1500), // Slower pulse
      );

      // Scale animation - smooth pulse effect
      final scaleAnimation =
          TweenSequence<double>([
              TweenSequenceItem(tween: Tween(begin: 0.7, end: 5.3), weight: 1),
              TweenSequenceItem(tween: Tween(begin: 5.3, end: 0.7), weight: 1),
            ]).animate(
              CurvedAnimation(parent: scaleController, curve: Curves.easeInOut),
            )
            ..addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                scaleController.repeat(reverse: true);
              }
            });

      // Circular movement controller - slower animation
      final circularController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 20), // Slower rotation
      )..repeat();

      // Circular movement animation
      final circularAnimation = Tween<double>(begin: 0, end: 2 * 3.14159)
          .animate(
            CurvedAnimation(parent: circularController, curve: Curves.linear),
          );

      _cupControllers.addAll([scaleController, circularController]);
      _scaleAnimations.add(scaleAnimation);
      _circularAnimations.add(circularAnimation);
    }

    // Start the scale animations
    for (int i = 0; i < _numberOfCups; i++) {
      _cupControllers[i * 2].forward();
    }

    // Start the main controller which will trigger the transition
    _mainController.forward();
  }

  @override
  void dispose() {
    _mainController.dispose();
    for (var controller in _cupControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.center,
      children: [
        // Animated coffee cups
        ...List.generate(_numberOfCups, (index) {
          return AnimatedBuilder(
            animation: Listenable.merge([
              _scaleAnimations[index],
              _circularAnimations[index],
              _mainController,
            ]),
            builder: (context, child) {
              final scale = _scaleAnimations[index].value;
              final angle = _circularAnimations[index].value;

              double left, top;
              final double centerX = size.width / 2 - _cupSize / 2;
              final double centerY = size.height / 2 - _cupSize / 2;

              if (_showScaleAnimation) {
                // First phase: scale animation (centered)
                return Center(
                  child: Transform.scale(
                    scale: scale * 1.5, // Larger scale for single cup
                    child: Image.asset(
                      Assets.logo2,
                      width: _cupSize * 1.5, // Larger size for single cup
                      height: _cupSize * 1.5,
                    ),
                  ),
                );
              } else if (_showCircularAnimation) {
                // Second phase: show rotating cups around center
                final radius = size.width * 0.2;
                left = centerX + (radius * math.cos(angle + (index * 1.26)));
                top = centerY + (radius * math.sin(angle + (index * 1.26)));

                return Positioned(
                  left: left,
                  top: top,
                  child: Transform.rotate(
                    angle: angle,
                    child: Image.asset(
                      Assets.logo2,
                      width: _cupSize,
                      height: _cupSize,
                    ),
                  ),
                );
              }

              // Transition phase: cups are hidden
              return const SizedBox.shrink();
            },
          );
        }),
      ],
    );
  }
}
