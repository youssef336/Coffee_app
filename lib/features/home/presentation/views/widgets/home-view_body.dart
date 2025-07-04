import 'package:coffeapp/core/utils/app_images.dart';
import 'package:coffeapp/features/home/presentation/views/widgets/card_item_list_builder.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
