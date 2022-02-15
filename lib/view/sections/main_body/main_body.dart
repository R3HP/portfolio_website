import 'package:flutter/material.dart';

import 'package:portfolio_app/constants.dart';
import 'package:portfolio_app/model/project.dart';
import 'package:portfolio_app/view/sections/main_body/my_header.dart';
import 'package:portfolio_app/view/sections/main_body/project_grid_view.dart';

class MainBody extends StatelessWidget {
  final List<Project> myProjects;
  // final ValueChanged<Project> handler;


  const MainBody({
    Key? key,
    required this.myProjects,
    // required this.handler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: const Color(0xFF242430),
      color: bgColor,
      padding: const EdgeInsets.only(left: 5),
      child: ListView(
        children: [
          MyHeader(myProjects: myProjects),
          ProjectSection(
            // handler: handler,
            myProjects: myProjects)
        ],
      ),
    );
  }
}

