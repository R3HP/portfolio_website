import 'package:flutter/material.dart';
import 'package:portfolio_app/model/project.dart';
import 'package:portfolio_app/view/sections/main_body/project_grid_item.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({
    Key? key,
    required this.myProjects,
  }) : super(key: key);

  final List<Project> myProjects;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: myProjects.length,
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        childAspectRatio: 1.2,
        maxCrossAxisExtent: 400,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (ctx, index) => ProjectGridItem(
        project: myProjects[index],
      ),
    );
  }
}

