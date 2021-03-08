import 'dart:async';

import '../Models/Project.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ProjectService {
  final String _url = 'https://osprojects.eu-gb.mybluemix.net/';
  List<Project> projects;
  final StreamController<List<Project>> _controller =
      StreamController<List<Project>>();

  get controller => _controller;

  void getNotAsyncProjects() async {
    projects = await getProjects();
    _controller.sink.add(projects);
  }

  void dispose() {
    _controller.close();
  }

  Future<List<Project>> getProjects() async {
    List<Project> result;
    var response = await http.get(this._url + 'project/all');
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
