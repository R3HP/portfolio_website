import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import 'package:portfolio_app/constants.dart';
import 'package:portfolio_app/model/project.dart';

class ProjectDetailsScreen extends StatelessWidget {
  static const routeName = '/details';
  final String projectId;

  const ProjectDetailsScreen({
    Key? key,
    required this.projectId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pathSegments = Uri.base.queryParameters;
    print(pathSegments);
    print(projectId);
    final project = Project.projects.firstWhere((element) => element.id == projectId);
    // final project = Project(name: 'no name', desc: 'no desc', keyPoints: ['no key'], gitHubUrl: 'www', imageUrl: '', platform: 'Flutter');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(project.name),
        backgroundColor: bgColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 3,
              child: FadeInImage(
                placeholder: const AssetImage('assets/images/header.jpg'),
                image: NetworkImage(project.imageUrl),
              ),
            ),
            Text(project.name,style: Theme.of(context).textTheme.subtitle1,),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  Expanded(child: Text(project.desc,style:Theme.of(context).textTheme.subtitle2,)),
                  const VerticalDivider(
                    color: primaryColor,
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: project.keyPoints.length,
                      itemBuilder: (ctx,index) => Row(
                        children: [
                          const Text('*', style: TextStyle(color: primaryColor),),
                          Text(project.keyPoints[index],)
                        ],
                      ), 
                    ),
                  ),
                ],
              ),
            ),
            Link(uri: Uri.parse(project.gitHubUrl), builder: (ctx,onTap) => ElevatedButton(onPressed: onTap, child: const Text('Clone It'),style: ElevatedButton.styleFrom(primary: primaryColor),))
          ],
        ),
      ),
    );
  }
}
