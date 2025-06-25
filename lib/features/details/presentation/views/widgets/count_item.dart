import 'package:flutter/material.dart';

class CountItem extends StatefulWidget {
  const CountItem({super.key});

  @override
  State<CountItem> createState() => _CountItemState();
}

class _CountItemState extends State<CountItem> {
  int couunt = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (couunt > 1) {
                    couunt--;
                  }
                });
              },
              child: const Text(
                "-",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              couunt.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  couunt++;
                });
              },
              child: const Text(
                "+",
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
