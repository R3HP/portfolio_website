import 'package:flutter/material.dart';
import 'package:portfolio_app/constants.dart';

import 'package:portfolio_app/model/project.dart';
import 'package:url_launcher/link.dart';

class ProjectDetailsScreen extends StatelessWidget {
  static const routeName = '/details';
  

  const ProjectDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final project = ModalRoute.of(context)?.settings.arguments as Project;
    print('argument is ${ModalRoute.of(context)?.settings.arguments}');
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
            Row(
              children: [
                Text(project.desc,style:Theme.of(context).textTheme.subtitle2,),
                const VerticalDivider(),
                Expanded(
                  child: ListView.builder(
                    itemCount: project.keyPoints.length,
                    itemBuilder: (ctx,index) => Row(
                      children: [
                        const Text('*', style: TextStyle(color: primaryColor),),
                        Expanded(child: Text(project.keyPoints[index],))
                      ],
                    ), 
                  ),
                ),
              ],
            ),
            Link(uri: Uri.parse(project.gitHubUrl), builder: (ctx,onTap) => ElevatedButton(onPressed: onTap, child: const Text('Clone It'),style: ElevatedButton.styleFrom(primary: primaryColor),))
          ],
        ),
      ),
    );
  }
}
