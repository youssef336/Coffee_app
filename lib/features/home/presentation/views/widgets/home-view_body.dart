// ignore_for_file: file_names

import 'package:coffeapp/features/home/presentation/views/widgets/card_item_list_builder.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [CardItemListBuilder()]);
  }
}
