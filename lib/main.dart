import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/constants.dart';
import 'package:portfolio_app/model/project.dart';
import 'package:portfolio_app/view/home_screen.dart';
import 'package:portfolio_app/view/sections/details_screen/details_screen.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          primaryColor: primaryColor,
          backgroundColor: bgColor,
          canvasColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white)
              .copyWith(
                  bodyText1: const TextStyle(color: bodyTextColor),
                  bodyText2: const TextStyle(color: bodyTextColor))),
      routeInformationParser: ProjectRouteInformationParser(),
      routerDelegate: ProjectRouterDelegate(),
      // home: const HomeScreen(),
      // routes: {
      //   ProjectDetailsScreen.routeName :(context) => const ProjectDetailsScreen()
      // },
    );
  }


}

class ProjectRoutePath {
  int? id;
  late bool isUnknown;

  ProjectRoutePath.home() : id=null , isUnknown = false;

  ProjectRoutePath.details(int id){
    this.id = id;
    isUnknown = false;
  }

  ProjectRoutePath.unknown() : id = null , isUnknown = true;

  bool get isHomePage => id == null && isUnknown == false ? true : false;

  bool get isDetailsPage => id != null;


  @override
  String toString() {
    // TODO: implement toString
    return 'Project Route Path is id:$id , isUnknwon :$isUnknown';
  }

}


class ProjectRouterDelegate extends RouterDelegate<ProjectRoutePath> with 
ChangeNotifier , PopNavigatorRouterDelegateMixin<ProjectRoutePath> {

  final _navigationKey = GlobalKey<NavigatorState>();
  Project? _selectedProject;
  bool show404 = false;


  ProjectRoutePath get currentConfiguration {
    print('get configurations');
    print('get configurations $show404');
    print('get configurations $_selectedProject');
    
    if (show404) {
      return ProjectRoutePath.unknown();
    }

    return _selectedProject == null
        ? ProjectRoutePath.home()
        : ProjectRoutePath.details(_selectedProject!.id);
  }


  static ProjectRouterDelegate of(BuildContext context) {
    final delegate = Router.of(context).routerDelegate;
    assert(delegate is ProjectRouterDelegate,'Delegate must of type Project Router Delegate');
    return delegate as ProjectRouterDelegate;
  }


  push(ProjectRoutePath newRoutePath){
    _selectedProject = Project.projects.firstWhere((element) => element.id == newRoutePath.id);
    notifyListeners();
  }


  void handleProjectTapped(Project project) {
    _selectedProject = project;
    notifyListeners();
  }

  

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigationKey;

  @override
  Widget build(BuildContext context) {
    print('Selected Project Id is ${_selectedProject?.id}');
    return Navigator(
      onPopPage: (route, result) {
        if(!route.didPop(result)){
          return false;
        }
        _selectedProject = null;
        show404 = false;
        notifyListeners();
        return true;

      },
      key: navigatorKey,
      pages: [
        const MaterialPage(
          key: ValueKey('home'),
          child: HomeScreen(
            // handler: handleProjectTapped
            )
          ),
        if(show404) 
           MaterialPage(key: const ValueKey('unknown'),child: UnknownScreen()),
        if(_selectedProject != null) 
           MaterialPage(key:  ValueKey('details/${_selectedProject!.id}'), child: const ProjectDetailsScreen(),arguments: Project.projects.firstWhere((element) => element.id == _selectedProject!.id))
      ],
    );
  }

  @override
  Future<void> setNewRoutePath(ProjectRoutePath configuration) async {
    print('why configurations id is ${configuration.id}');
    print('why configurations unknown is ${configuration.isUnknown}');
    print('configuration is home ${configuration.isHomePage}');
    print('configuration is unknown ${configuration.isUnknown}');
    if (configuration.isUnknown) {
      _selectedProject = null;
      show404 = true;
      return;
    }

    print('configuration is details ${configuration.isDetailsPage}');
    print('configuration is details id is ${configuration.id}');
    if (configuration.isDetailsPage) {
      if (configuration.id! < 0 || configuration.id! > Project.projects.length) {
        show404 = true;
        return;
      }
      
      _selectedProject = Project.projects.firstWhere((element) => element.id == configuration.id);
      print('id of selected project is ${_selectedProject?.id}');
    }else{
      _selectedProject = null;
    }
    show404 =false;
    notifyListeners();
  }
}

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

class UnknownScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Page Not Found'),),
    );
  }

}


// class ProjectRouterInformationParser extends RouteInformationParser {
//   @override
//   Future parseRouteInformation(RouteInformation routeInformation) {
//     routeInformation.
//   }

// }