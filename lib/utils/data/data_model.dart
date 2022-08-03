class DataModel {
  String name;
  String key;

  DataModel({
    required this.name,
    required this.key,
  });
}

class ProjectModel {
  String name;
  String key;
  String temps;
  String question;
  bool isend;
  
  ProjectModel({
    required this.name,
    required this.key,
    required this.temps,
    required this.question,
    required this.isend,
  });
}
