import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart' show BuildContext, ValueKey;
import 'package:portfolio_app/model/project.dart';
import 'package:portfolio_app/view/home_screen.dart';
import 'package:portfolio_app/view/sections/details_screen/details_screen.dart';
import 'package:portfolio_app/view/sections/unknown/unknown_screen.dart';

class HomeLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(
      BuildContext context, RouteInformationSerializable state) {
    return [
      const BeamPage(
          key: ValueKey('/home'),
          child: HomeScreen(),
          title: 'Portfolio Website')
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/'];
}

class ProjectDetailsLocation extends BeamLocation<BeamState> {
  

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    
    final pages = [
      const BeamPage(

          key: ValueKey('/home'),
          child: HomeScreen(),
          title: 'Portfolio Website'),
    ];
    if (state.uri.pathSegments[0] == 'details') {
      final projectId = int.tryParse(state.uri.pathSegments[1]);
      if (projectId != null) {
        final project =
            Project.projects.firstWhere((project) => project.id == projectId);
        pages.add(
          BeamPage(
            popToNamed: '/',
              key: ValueKey('/details/${projectId}'),
              child: ProjectDetailsScreen(project: project),
              title: project.name),
        );

      }
      
    }
    return pages;
  }

  

  @override
  List<Pattern> get pathPatterns => ['/','/details/:id'];
}

class UnknownLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(
      BuildContext context, RouteInformationSerializable state) {
    return [
      const BeamPage(key: ValueKey('/home'), child: HomeScreen()),
      const BeamPage(key: ValueKey('/404'), child: UnknownScreen())
    ];
  }

  @override
  
  List<Pattern> get pathPatterns => ['/','/404'];
}
