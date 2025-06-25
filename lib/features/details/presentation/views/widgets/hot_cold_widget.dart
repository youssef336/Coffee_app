// ignore: unnecessary_import
import 'dart:ui';

import 'package:flutter/material.dart';

class HotColdWidget extends StatefulWidget {
  const HotColdWidget({super.key});

  @override
  State<HotColdWidget> createState() => _HotColdWidgetState();
}

class _HotColdWidgetState extends State<HotColdWidget> {
  bool isHot = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.grey[400],
      ),
      clipBehavior: Clip.antiAlias,

      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              isHot = false;
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6),
              child: AnimatedContainer(
                curve: Curves.bounceInOut,

                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: isHot ? Colors.grey[400] : Colors.white,
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      "ice",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              isHot = true;
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6),
              child: AnimatedContainer(
                curve: Curves.bounceInOut,
                duration: const Duration(milliseconds: 200),

                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: isHot ? Colors.white : Colors.grey[400],
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      "hot",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
