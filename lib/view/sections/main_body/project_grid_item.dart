import 'package:flutter/material.dart';
import 'package:portfolio_app/constants.dart';
import 'package:portfolio_app/model/project.dart';
import 'package:portfolio_app/view/sections/details_screen/details_screen.dart';
import 'package:url_launcher/link.dart';

class ProjectGridItem extends StatelessWidget {
  final Project project;
  // final ValueChanged<Project> handler;

  const ProjectGridItem({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.name,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Text(project.desc,
          maxLines: 9,
          overflow: TextOverflow.ellipsis,

              style: Theme.of(context).textTheme.subtitle2),
          const Spacer(),
          // TextButton(
          //     onPressed: () {
          //       // final router = Router.of(context).routerDelegate as ProjectRouterDelegate;
          //       final router = ProjectRouterDelegate.of(context);
          //       router.push(ProjectRoutePath.details(project.id));

          //     },
          //     child: const Text(
          //       'Read More ...',
          //       style: TextStyle(color: primaryColor),
          //     ),
          // )
          Link(
            uri: Uri.parse(ProjectDetailsScreen.routeName+'/${project.id}'),
            builder: (ctx, onTap) => TextButton(
              onPressed: onTap,
              child: const Text(
                'Read More ...',
                style: TextStyle(color: primaryColor),
              ),
            ),
          )
          
        ],
      ),
    );
  }
}
