import 'package:coffeapp/core/utils/app_images.dart';
import 'package:coffeapp/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height * 0.3,
          left: 0,
          right: 0,
          child: TweenAnimationBuilder<double>(
            duration: const Duration(seconds: 1),
            tween: Tween(begin: 0.0, end: 1.0),
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0.0, 20 * (1 - value)),
                  child: child,
                ),
              );
            },
            child: const Hero(
              tag: 'logo_text',
              child: Text(
                'Coffee App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2.0,
                  shadows: [
                    Shadow(
                      color: Colors.black54,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        Positioned(
          left: 0,
          right: 0,
          top:
              MediaQuery.of(context).size.height *
              0.4, // Center the logo vertically
          child: Hero(
            tag: 'logo',
            child: Image.asset(
              Assets.logo2,
              height: 200, // Match the height in home screen
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned(
          bottom: 200,
          right: 0,
          left: 0,
          child: IconButton(
            color: Colors.black87,

            onPressed: () {
              Navigator.pushNamed(context, HomeView.routeName);
            },
            icon: const Icon(Icons.arrow_forward_ios, size: 60),
          ),
        ),
      ],
    );
  }
}
