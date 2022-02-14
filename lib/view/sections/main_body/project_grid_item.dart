import 'package:flutter/material.dart';
import 'package:portfolio_app/constants.dart';
import 'package:portfolio_app/model/project.dart';
import 'package:portfolio_app/view/sections/details_screen/details_screen.dart';
import 'package:url_launcher/link.dart';

class ProjectGridItem extends StatelessWidget {
  final Project project;

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
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const Spacer(),
          Expanded(
              child: SingleChildScrollView(
                  child: Text(project.desc,
                      style: Theme.of(context).textTheme.subtitle2))),
          const Spacer(),
          Link(

            uri: Uri(path:ProjectDetailsScreen.routeName,queryParameters: {'id' : project.id}),
            builder: (ctx, onTap) {
              print(onTap);
              final uri = Uri(path:ProjectDetailsScreen.routeName,queryParameters: {'id' : project.id});
              print(uri.toString());
              return TextButton(
              onPressed: onTap,
              child: const Text(
                'Read More ...',
                style: TextStyle(color: primaryColor),
              ),
            );
            },
          )
        ],
      ),
    );
  }
}
