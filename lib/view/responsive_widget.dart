import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    Key? key,
    this.smallScreen,
    this.mediusScreen,
    required this.largeScreen,
  }) : super(key: key);

  final Widget? smallScreen;
  final Widget? mediusScreen;
  final Widget largeScreen;

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isMediumScreen(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 800 && width <= 1200;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return largeScreen;
      } else if (constraints.maxHeight < 800) {
        return smallScreen ?? largeScreen;
      } else {
        return mediusScreen ?? largeScreen;
      }
    });
  }
}
