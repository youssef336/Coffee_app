import 'package:coffeapp/features/details/presentation/views/details_view.dart';
import 'package:coffeapp/features/home/data/models/drink-model.dart';
import 'package:coffeapp/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeView.routeName:
      return MaterialPageRoute(builder: (_) => const HomeView());
    case DetailsView.routeName:
      final drink = settings.arguments as DrinkModel;
      return MaterialPageRoute(builder: (_) => DetailsView(drink: drink));
    default:
      return MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text('404 Not Found'))),
      );
  }
}
