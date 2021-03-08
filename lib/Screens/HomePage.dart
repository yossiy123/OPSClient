import 'dart:async';
import 'dart:convert' as convert;

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:ospclient/Models/Project.dart';
import 'package:ospclient/Services/ProjectService.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _url = 'https://osprojects.eu-gb.mybluemix.net/';
  //Future<List<Project>> _future;
  ProjectService _projectService;
  // final StreamController<List<Project>> _controller =
  //     StreamController<List<Project>>();

  @override
  void initState() {
    super.initState();
    //_future = this.getProjects();
    _projectService = new ProjectService();
    _projectService.getNotAsyncProjects();
    //_controller.sink.add(_projectService.projects);
    //_controller.add(event)
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _projectService.dispose();
    //_controller.close();
  }

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width * 0.15;
    AppBar myAppBar = AppBar(
      title: Text("Open Source Projects"),
      leading: Icon(Icons.work),
      actions: [
        IconButton(
            icon: const Icon(Icons.add_box_outlined),
            tooltip: 'Add OpenSourceProject',
            onPressed: () {}),
        IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'find OpenSourceProject',
            onPressed: () {}),
      ],
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: myAppBar.preferredSize,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: widthScreen),
            child: myAppBar),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: widthScreen),
        child: StreamBuilder(
          stream: _projectService.controller.stream,
          builder:
              (BuildContext context, AsyncSnapshot<List<Project>> snapshot) {
            Widget widget;
            if (!snapshot.hasData) {
              widget = Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.lightBlueAccent,
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.done ||
                snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasError) {
                widget = Text("error");
              } else if (snapshot.hasData) {
                widget = ListView.separated(
                  itemCount: snapshot.data.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    color: Colors.black54,
                  ),
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
        ),
      ),
    );
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

  List<Project> getR() {
    List<Project> a = [
      Project(id: 0, name: "asdasd", description: "wawag"),
      Project(id: 1, name: "aa", description: "bbb"),
    ];
    print(a);
    return a;
  }
}

/* PROVIDER (FUTURE PROVIDER?)
CREATE provider on the top(wrap metrial app) "changenotifierprovider<class> , builder:  (context) => new Class()" 
** if u have many providers u can use MultiProvider
create class Data extend changenotifier create method to change the variable and run changenotifier()
provider.of<datA>(context, listener: false?).variable;
if we want something get update we can warp it with consumer<data> builder: context, data,child ) return listtile using data.data
*/
