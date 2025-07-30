import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:coffeapp/features/home/presentation/views/home_view.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Display Rive animation with clickable listener areas
        const Positioned(
          left: 0,
          right: 0,
          child: SizedBox(
            height: 800,
            child: RiveAnimation.asset(
              'assets/coffe_animation.riv',

              fit: BoxFit.contain,
              stateMachines: ['State Machine 1'],
              isTouchScrollEnabled: false, // Ensure this matches
            ),
          ),
        ),

        // Navigation button
        Positioned(
          bottom: 180,
          left: 0,
          right: 0,
          child: IconButton(
            icon: const Icon(Icons.arrow_forward_ios, size: 60),
            color: Colors.black87,
            onPressed: () {
              Navigator.pushNamed(context, HomeView.routeName);
            },
          ),
        ),
      ],
    );
  }
}
