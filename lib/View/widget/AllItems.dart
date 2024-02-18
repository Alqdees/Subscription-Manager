import 'package:flutter/material.dart';
import 'package:subscription_manager/View/Colors/Colors.dart';

// ignore: must_be_immutable
class AllItems extends StatelessWidget {
  // const CardViewList({super.key});

  String name, price;
  VoidCallback onPressed;
  AllItems(
      {super.key,
      required this.name,
      required this.price,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.more_horiz,
              ),
            ),
          )
        ],
      ),
    );
  }
}
