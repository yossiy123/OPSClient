import 'dart:convert' as convert;

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:ospclient/Models/Project.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  final String _url = 'https://osprojects.eu-gb.mybluemix.net/';

  @override
  Widget build(BuildContext context) {
    //List<Project> projects = new List<Project>();
    //projects.add(
    //  new Project(
    //      id: 1,
    //      name: "Important project",
    //      description: "Very important project"),
    //);
    //projects.add(
    //  new Project(
    //      id: 2,
    //      name: "Interesting project",
    //      description: "Very interesting project"),
    //);
    //projects.add(
    //  new Project(id: 3, name: "Bad project", description: "Very bad project"),
    //);

    //List<Project> projects =

    return Scaffold(
        body: FutureBuilder(
      future: this.getProjects(),
      builder: (BuildContext context, AsyncSnapshot<List<Project>> snapshot) {
        Widget widget;
        if (snapshot.connectionState == ConnectionState.waiting) {
          widget = Text("Loading...");
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            widget = Text("error");
          } else if (snapshot.hasData) {
            widget = ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(snapshot.data[index].name),
                  leading: Text(snapshot.data[index].id.toString()),
                  subtitle: Text(snapshot.data[index].description),
                );
              },
            );
          }
        }
        return widget;
      },
    ));

    //ListView.builder(
    //    itemCount: projects.length,
    //    itemBuilder: (BuildContext context, int index) {
    //      return ListTile(
    //        title: Text(projects[index].name),
    //        leading: Text(projects[index].id.toString()),
    //        subtitle: Text(projects[index].description),
    //      );
    //    },
    //  ),
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
