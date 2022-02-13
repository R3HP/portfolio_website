import 'package:flutter/material.dart';
import 'package:portfolio_app/view/sections/side_menu/codin_item.dart';


class CodingCard extends StatelessWidget {
  const CodingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF242430),
      padding:
          const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0, bottom: 10.0),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: [
          Text(
            'Coding',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.white),
          ),
          const Divider(),
          Column(
            children: const [
              CodingItem(label: 'Dart', percent: 80),
              CodingItem(label: 'JS', percent: 30),
              CodingItem(label: 'Java', percent: 50),
              CodingItem(label: 'Python', percent: 30)
            ],
          )
        ],
      ),
    );
  }
}






