import 'package:flutter/material.dart';
import 'package:portfolio_app/model/project.dart';
import 'package:portfolio_app/routes/route_path.dart';
import 'package:portfolio_app/view/home_screen.dart';
import 'package:portfolio_app/view/sections/details_screen/details_screen.dart';
import 'package:portfolio_app/view/unknwon_screen.dart';

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


  // void handleProjectTapped(Project project) {
  //   _selectedProject = project;
  //   notifyListeners();
  // }

  

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigationKey;

  @override
  Widget build(BuildContext context) {
    print('Selected Project Id is ${_selectedProject?.id}');
    return Navigator(
      onPopPage: handleOnPopPage,
      key: navigatorKey,
      pages: [
        const MaterialPage(
          key: ValueKey('home'),
          child: HomeScreen(
            )
          ),
        if(show404) 
           MaterialPage(key: const ValueKey('unknown'),child: UnknownScreen()),
        if(_selectedProject != null) 
           MaterialPage(key:  ValueKey('details/${_selectedProject!.id}'), child: const ProjectDetailsScreen(),arguments: Project.projects.firstWhere((element) => element.id == _selectedProject!.id))
      ],
    );
  }

  bool handleOnPopPage(route, result) {
      if(!route.didPop(result)){
        return false;
      }
      _selectedProject = null;
      show404 = false;
      notifyListeners();
      return true;
  
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
