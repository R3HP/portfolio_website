import 'package:flutter/material.dart';

class BioItem extends StatelessWidget {
  final String itemName;
  final String itemValue;

  const BioItem({
    Key? key,
    required this.itemName,
    required this.itemValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(itemName,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w800)),
        Text(itemValue)
      ]),
    );
  }
}