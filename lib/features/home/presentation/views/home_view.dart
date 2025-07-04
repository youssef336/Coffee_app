import 'package:coffeapp/features/home/presentation/views/widgets/home-view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: Colors.brown, body: HomeViewBody());
  }
}
