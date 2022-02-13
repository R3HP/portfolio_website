import 'package:flutter/material.dart';
import 'package:portfolio_app/constants.dart';
import 'package:portfolio_app/view/sections/side_menu/bid_card.dart';
import 'package:portfolio_app/view/sections/side_menu/coding_item.dart';
import 'package:portfolio_app/view/sections/side_menu/ifo_card.dart';
import 'package:portfolio_app/view/sections/side_menu/skill_card.dart';
import 'package:url_launcher/link.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const InfoCard(),
          Expanded(
            child: ListView(
              children: [
                const BioCard(),
                const SkillsCard(),
                const CodingCard(),
                Column(
                  children: [
                    Text(
                      'Contact Me',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: Colors.white),
                    ),
                    const Divider(),
                    Container(
                      color: Colors.white.withOpacity(0.2),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 8.0),
                      margin: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 40),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Spacer(),
                          Link(
                            target: LinkTarget.blank,
                            uri: Uri.parse(
                                'https://github.com/R3HP?tab=repositories'),
                            builder: (ctx, onTap) => InkWell(
                                onTap: onTap, child: Image.asset('assets/icons/github.png',width: 20,height: 20)),
                          ),
                          const SizedBox(
                            width: defaultPadding / 4,
                          ),
                          Link(
                            target: LinkTarget.blank,
                            uri: Uri.parse(
                                'mailto:logicdevrhp@gmail.com'),
                            builder: (ctx, onTap) => IconButton(
                                onPressed: onTap, icon: const Icon(Icons.mail,size: 20,color: Colors.black,)),
                          ),
                          const SizedBox(
                            width: defaultPadding / 4,
                          ),
                          Link(
                            target: LinkTarget.blank,
                            uri: Uri.parse(
                                'https://www.linkedin.com/in/reza-hosseinypour-b84a26229'),
                            builder: (ctx, onTap) => InkWell(
                                onTap: onTap, child: Image.asset('assets/icons/linkedin.png',width: 20,height: 20)),
                          ),
                          const SizedBox(
                            width: defaultPadding / 4,
                          ),
                          Link(
                            target: LinkTarget.blank,
                            uri: Uri.parse(
                                ''),
                            builder: (ctx, onTap) => InkWell(
                                onTap: onTap, child: Image.asset('assets/icons/twitter.png',width: 20,height: 20,)),
                          ),
                          const Spacer()
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
