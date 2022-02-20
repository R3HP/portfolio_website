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
    return 'Project Route Path is id:$id , isUnknwon :$isUnknown';
  }

}
