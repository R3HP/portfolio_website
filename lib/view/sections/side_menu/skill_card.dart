import 'package:flutter/material.dart';
import 'package:portfolio_app/constants.dart';
import 'package:portfolio_app/view/sections/side_menu/skill_circular_progress.dart';

class SkillsCard extends StatelessWidget {
  const SkillsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0, bottom: 10.0),
      color: const Color(0xFF242430),
      // color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Skils',
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.white),
          ),
          const Divider(),
          const SizedBox(
            height: defaultPadding,
          ),
          Row(
            children: const [
              SizedBox(
                width: defaultPadding,
              ),
              SkillAnimatedCircularProgress(
                label: 'Flutter',
                percentage: 70,
              ),
              SizedBox(
                width: 2 * defaultPadding,
              ),
              SkillAnimatedCircularProgress(
                label: 'NodeJs',
                percentage: 20,
              ),
              SizedBox(
                width: 2 * defaultPadding,
              ),
              SkillAnimatedCircularProgress(
                label: 'Java',
                percentage: 50,
              ),
              SizedBox(
                width: defaultPadding,
              ),
            ],
          )
        ],
      ),
    );
  }
}