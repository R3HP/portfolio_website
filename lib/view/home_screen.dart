import 'package:flutter/material.dart';
import 'package:portfolio_app/constants.dart';
import 'package:portfolio_app/model/project.dart';
import 'package:portfolio_app/view/responsive_widget.dart';
import 'package:portfolio_app/view/sections/main_body/main_body.dart';
import 'package:portfolio_app/view/sections/side_menu/side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                  myProjects: [
                    Project(
                        name: 'Security Check In App',
                        desc:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        keyPoints: [''],
                        gitHubUrl: '',
                        imageUrl: '',
                        platform: 'Flutter'),
                    Project(
                        name: 'Chat App With Video Calling',
                        desc:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        keyPoints: [''],
                        gitHubUrl: '',
                        imageUrl: '',
                        platform: 'Flutter'),
                    Project(
                        name: 'Food Ordering App',
                        desc: 'Lorem ipsum dolor sit amet',
                        keyPoints: [''],
                        gitHubUrl: '',
                        imageUrl: '',
                        platform: 'Flutter'),
                    Project(
                        name: 'Shop Api',
                        desc:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        keyPoints: [''],
                        gitHubUrl: '',
                        imageUrl: '',
                        platform: 'NodeJs'),
                  ],
                )),
          ],
        ));
  }
}
