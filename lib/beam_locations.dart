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
    return [const BeamPage(key: ValueKey('/home'), child: HomeScreen())];
  }

  @override
  List<Pattern> get pathPatterns => ['/'];
}

class ProjectDetailsLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(key: ValueKey('/home'), child: HomeScreen()),
    ];
    if (state.uri.pathSegments[0] == 'details'){
      final projectId = int.tryParse(state.uri.pathSegments[1]);
        if (projectId != null){
          pages.add(BeamPage(key: ValueKey('/details/${projectId}'),child: const ProjectDetailsScreen(),routeBuilder: (context,setting,child){
            setting.copyWith(arguments: Project.projects.firstWhere((project) => project.id == projectId));
            context
          }));
    }}
    return pages;
  }

  @override
  List<Pattern> get pathPatterns => ['/details/:id'];

  // ProjectDetailsScreen.withParameters({
  //   Map<String,String> path,
  //   Map<String,String> query
  // }) : super

  // @override
  // List<BeamPage> buildPages(BuildContext context, RouteInformationSerializable state) {
  //   return [
  //     const BeamPage(
  //       key: ValueKey('/home'),
  //       child: HomeScreen()
  //     ),
  //     if(state.)
  //   ];
  // }

  // @override
  // List<Pattern> get pathPatterns => ['/details/:id'];

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
  // TODO: implement pathPatterns
  List<Pattern> get pathPatterns => throw UnimplementedError();
}
