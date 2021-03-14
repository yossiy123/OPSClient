import 'dart:async';

import '../Models/Project.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ProjectService {
  final String _url = 'https://osprojects.eu-gb.mybluemix.net/';
  List<Project> projects;
  List<Project> mainList;
  final StreamController<List<Project>> _controller =
      StreamController<List<Project>>();

  get controller => _controller;

  void getNotAsyncProjects() async {
    projects = await getProjects();
    mainList = projects.toList();
    _controller.sink.add(projects);
  }

  void searchProjects(String nameSearch) {
    if (nameSearch.isEmpty) {
      projects = mainList.toList();
    }
    nameSearch = nameSearch.toLowerCase();
    if (projects.isNotEmpty) projects.clear();
    mainList.forEach((project) {
      if (project.name.toLowerCase().contains(nameSearch)) {
        projects.add(project);
      }
    });
    _controller.sink.add(projects);
  }

  void dispose() {
    _controller.close();
  }

  Future<List<Project>> getProjects() async {
    List<Project> result;
    var response = await http.get(Uri.parse(this._url + 'project/all'));
    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      if (json['success'] == true) {
        result = (json['data'] as List)
            .map((projectJson) => Project.fromJson(projectJson))
            .toList();
      } else {
        print(json['message']); // Change to error message
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return result;
  }
}
