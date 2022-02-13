import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color: const Color(0xFF242430),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(
              flex: 2,
            ),
            CircleAvatar(
              backgroundImage: Image.asset('assets/images/pic.jpg').image,
              // backgroundColor: Colors.red,
              radius: 50,
            ),
            const Spacer(
              flex: 1,
            ),
            Text(
              'Reza HosseinyPour',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Text(
              'Flutter Deveoper',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
