import 'package:flutter/material.dart';

import 'package:portfolio_app/constants.dart';
import 'package:portfolio_app/model/project.dart';
import 'package:portfolio_app/view/responsive_widget.dart';
import 'package:portfolio_app/view/sections/main_body/main_body.dart';
import 'package:portfolio_app/view/sections/side_menu/side_menu.dart';

class HomeScreen extends StatelessWidget {
  // final ValueChanged<Project> handler;
  const HomeScreen({
    Key? key,
    // required this.handler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ResponsiveWidget.isSmallScreen(context)
            ? AppBar(
                backgroundColor: bgColor,
                centerTitle: true,
                title: const Text('Discover My Application'),
              )
            : null,
        drawer:
            ResponsiveWidget.isSmallScreen(context) ? const SideMenu() : null,
        body: Row(
          children: [
            !ResponsiveWidget.isSmallScreen(context)
                ? const Expanded(
                    flex: 2,
                    child: SideMenu(),
                  )
                : Container(),
            Expanded(
                flex: 7,
                child: MainBody(
                  // handler: handler,
                  myProjects:Project.projects,
                )),
          ],
        ));
  }
}
