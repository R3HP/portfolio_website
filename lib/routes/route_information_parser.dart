
import 'package:flutter/material.dart';
import 'package:portfolio_app/routes/route_path.dart';

class ProjectRouteInformationParser extends RouteInformationParser<ProjectRoutePath>{

  @override
  Future<ProjectRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);


    print('uri is ${uri.toString()}');
    print('uri path segments is ${uri.pathSegments}');
    print('uri path segments length ${uri.pathSegments.length}');

    // Hanlde '/'
    if(uri.pathSegments.isEmpty){
      return ProjectRoutePath.home();
    }

    // Handle '/details/:id'
    if (uri.pathSegments.length == 2 ) {
      if (uri.pathSegments[0] != 'details') { 
        print('uri pathsegment[0] is nor details');
        return ProjectRoutePath.unknown();
      }
      var remaining = uri.pathSegments[1];
      var id = int.tryParse(remaining);
      print('id is $id');
      if (id == null) {
        return ProjectRoutePath.unknown();
      }else{
        print('now returns details');
        return ProjectRoutePath.details(id);
      }
      
    }
    return ProjectRoutePath.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(ProjectRoutePath configuration) {
    print('restore configurations is $configuration');
    if (configuration.isUnknown) {
      return const RouteInformation(location: '/404');
    }else if (configuration.isHomePage){
      return const RouteInformation(location: '/');
    }else if(configuration.isDetailsPage){
      return RouteInformation(location: '/details/${configuration.id}');
    }
    return null;
  }
}
