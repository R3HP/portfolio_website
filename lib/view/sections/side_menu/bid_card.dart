import 'package:flutter/material.dart';
import 'package:portfolio_app/view/sections/side_menu/bio_item.dart';

class BioCard extends StatelessWidget {
  const BioCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF242430),
      margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Column(
        children: const [
          BioItem(itemValue: 'Iran', itemName: 'Residence'),
          BioItem(itemValue: 'logicdevrhp@gmail.com', itemName: 'Email'),
          BioItem(
            itemValue: 'CS from Mazust',
            itemName: 'Degree',
          ),
          BioItem(
            itemValue: 'someLinKWillBeHere',
            itemName: 'LinkedIn',
          ),
        ],
      ),
    );
  }
}