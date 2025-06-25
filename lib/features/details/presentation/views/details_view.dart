import 'package:coffeapp/features/details/presentation/views/widgets/details_view_body.dart';
import 'package:coffeapp/features/home/data/models/drink-model.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.drink});
  static const routeName = '/details';
  final DrinkModel drink;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DetailsViewBody(drink: drink),
    );
  }
}
