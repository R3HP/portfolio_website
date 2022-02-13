import 'package:flutter/material.dart';
import 'package:portfolio_app/constants.dart';

class SkillAnimatedCircularProgress extends StatelessWidget {
  final String label;
  final double percentage;

  const SkillAnimatedCircularProgress({
    Key? key,
    required this.label,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.23,
            child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: percentage / 100),
                duration: defaultDuration,
                builder: (ctx, double value, child) => Stack(
                      fit: StackFit.expand,
                      alignment: Alignment.center,
                      children: [
                        CircularProgressIndicator(
                          backgroundColor: darkColor,
                          value: value,
                          color: primaryColor,
                        ),
                        Center(child: Text('${(value * 100).toInt()}%'))
                      ],
                    )),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            label,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
