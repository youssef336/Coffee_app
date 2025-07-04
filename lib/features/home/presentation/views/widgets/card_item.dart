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
    final size = MediaQuery.of(context).size;
    double paddingLeft = size.width * 0.01;
    double paddingTop = size.height * 0.003;

    return SizedBox(
      height: 170, // Fixed height for the card
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Card(
                elevation: 3,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const SizedBox.expand(),
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
                  width: 80,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 30,
                        spreadRadius: 2,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
                Image.asset(image, fit: BoxFit.contain, height: 500, width: 70),
              ],
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: paddingLeft,
                  top: paddingTop,
                  right: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Text(
                        subtitle,
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 30,
            bottom: 40,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.brown,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
