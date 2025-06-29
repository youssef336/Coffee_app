import 'package:coffeapp/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class CupSize extends StatefulWidget {
  const CupSize({super.key});

  @override
  State<CupSize> createState() => _CupSizeState();
}

class _CupSizeState extends State<CupSize> {
  int currentindex = 5;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(4, (index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  currentindex = index;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: currentindex == index
                      ? Colors.orange
                      : Colors.white,
                  child: Image.asset(Assets.drinksCupSize, cacheHeight: 35),
                ),
              ),
            ),
            Row(
              children: [
                if (index == 0) const Text("Small"),
                if (index == 1) const Text("Medium"),
                if (index == 2) const Text("Large"),
                if (index == 3) const Text("Extra Large"),
              ],
            ),
          ],
        );
      }),
    );
  }
}
