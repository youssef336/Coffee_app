import 'package:coffeapp/features/details/presentation/views/details_view.dart';
import 'package:coffeapp/features/home/data/models/drink-model.dart';
import 'package:coffeapp/features/home/presentation/views/widgets/card_item.dart';
import 'package:flutter/material.dart';

class CardItemListBuilder extends StatefulWidget {
  const CardItemListBuilder({super.key});

  @override
  State<CardItemListBuilder> createState() => _CardItemListBuilderState();
}

class _CardItemListBuilderState extends State<CardItemListBuilder> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: DrinkModel.drinks.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _scrollController,
            builder: (context, child) {
              double offset = 0;
              if (_scrollController.hasClients) {
                offset = _scrollController.offset / 130 - index;
              }
              offset = offset.clamp(0, 1);
              return Transform.scale(
                scale: 1 - (offset * 0.16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DetailsView.routeName,
                      arguments: DrinkModel.drinks[index],
                    );
                  },
                  child: CardItem(
                    title: DrinkModel.drinks[index].name,
                    image: DrinkModel.drinks[index].image,
                    subtitle: DrinkModel.drinks[index].description,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
