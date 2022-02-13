import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/constants.dart';

import 'package:portfolio_app/model/project.dart';
import 'package:url_launcher/link.dart';

class MyHeader extends StatelessWidget {
  final List<Project> myProjects;

  const MyHeader({
    Key? key,
    required this.myProjects,
  }) : super(key: key);

  // void nextAnimation() {
  //   if (index ++  >= widget.myProjects.length - 1) {
  //     index = 0;
  //   } else {
  //     index += 1;
  //   }
  //   print(index);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    // print(widget.myProjects[index].name);
    return Container(
      color: const Color(0xFF242430),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.6,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/header.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            color: darkColor.withOpacity(0.66),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Discover My Applications',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.subtitle1!,
                  child: Row(
                    children: [
                      const Text('  I Build ',
                          style: TextStyle(color: primaryColor)),
                      const Text('<'),
                      // TyperAnimatedText().textWidget(data)
                      AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: myProjects
                              .map((project) => TyperAnimatedText(
                                    project.platform + '>' + ' ' + project.name,

                                    // textStyle:
                                    //     const TextStyle(color: primaryColor)
                                  ))
                              .toList()),
                      // const Text('>'),
                      // AnimatedTextKit(
                      //   onFinished: () => nextAnimation(),
                      //   isRepeatingAnimation: false,
                      //     animatedTexts:
                      //     widget.myProjects
                      //         .map((project) => TyperAnimatedText(project.name,speed: Duration(milliseconds: 15,),))
                      //         .toList(),
                      //     ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Link(
                    uri: Uri.parse('https://github.com/R3HP?tab=repositories'),
                    builder: (ctx, onTap) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: primaryColor),
                        onPressed: onTap,
                        child: const Text('Check it out'),
                      );
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
