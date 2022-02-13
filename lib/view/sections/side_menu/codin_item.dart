import 'package:flutter/material.dart';
import 'package:portfolio_app/constants.dart';

class CodingItem extends StatelessWidget {
  final String label;
  final int percent;

  const CodingItem({
    Key? key,
    required this.label,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0.0, end: percent / 100),
        duration: defaultDuration,
        curve: Curves.linear,
        builder: (ctx, double value, child) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label),
                Text('${(value * 100).toInt()}%'),
              ],
            ),
            LinearProgressIndicator(
              backgroundColor: darkColor,
              value: value,
              color: primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

