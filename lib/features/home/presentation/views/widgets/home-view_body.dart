import 'package:coffeapp/core/utils/app_images.dart';
import 'package:coffeapp/features/home/presentation/views/widgets/card_item_list_builder.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // App Title
        Positioned(
          left: 20,
          top: 10,
          child: Hero(
            tag: 'logo_text',
            flightShuttleBuilder:
                (
                  flightContext,
                  animation,
                  flightDirection,
                  fromHeroContext,
                  toHeroContext,
                ) {
                  return DefaultTextStyle(
                    style: DefaultTextStyle.of(toHeroContext).style,
                    child: toHeroContext.widget,
                  );
                },
            child: const Material(
              type: MaterialType.transparency,
              color: Colors.transparent,
              child: Text(
                'Coffee App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                  shadows: [
                    Shadow(
                      color: Colors.black54,
                      blurRadius: 8,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Hero(
            tag: 'logo',
            child: Image.asset(Assets.logo2, height: 80, fit: BoxFit.contain),
          ),
        ),
        // Main content
        const Positioned(child: CardItemListBuilder()),

        // Logo at the top with Hero
      ],
    );
  }
}
