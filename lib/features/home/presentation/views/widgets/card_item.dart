import 'package:coffeapp/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.title,
    required this.image,
    required this.subtitle,
  });
  final String title;
  final String image;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    double paddingLeft = MediaQuery.of(context).size.width * 0.01;
    double paddingTop = MediaQuery.of(context).size.height * 0.06;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
          child: Card(
            elevation: 3,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 70, horizontal: 3),
              child: Row(),
            ),
          ),
        ),
        Positioned(
          top: -10,
          left: 20,
          bottom: 45,

          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 70,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    const BoxShadow(
                      blurRadius: 30,
                      spreadRadius: 2,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),

              Image.asset(image, fit: BoxFit.contain),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.only(left: paddingLeft, top: paddingTop),
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text(title, textAlign: TextAlign.center),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(left: 80),
              child: Text(subtitle, textAlign: TextAlign.center),
            ),
          ),
        ),

        Positioned(
          right: 50,
          bottom: 50,
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black),
            ),
            child: const Icon(
              Icons.arrow_forward_sharp,
              color: Colors.black54,
              size: 15,
            ),
          ),
        ),
      ],
    );
  }
}
