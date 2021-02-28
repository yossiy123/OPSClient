class Project {
  int id;
  String name;
  String description;

  Project({this.id, this.name, this.description});

  factory Project.fromJson(dynamic json) {
    return Project(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }
}
