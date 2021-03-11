import 'package:flutter/material.dart';

import 'package:ospclient/Models/Project.dart';
import 'package:ospclient/Services/ProjectService.dart';
import 'package:ospclient/Widgets/searchWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final String _url = 'https://osprojects.eu-gb.mybluemix.net/';
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
  }

  @override
  void dispose() {
    super.dispose();
    _projectService.dispose();
    //_controller.close();
  }

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width * 0.15;
    AppBar myAppBar = AppBar(
      backgroundColor: Colors.teal,
      title: SearchTitle(),
      leading: Icon(Icons.work),
    );
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: myAppBar.preferredSize,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: widthScreen),
              child: myAppBar),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: widthScreen, vertical: 10),
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
                      return ProjectCard(
                          name: snapshot.data[index].name,
                          id: snapshot.data[index].id.toString(),
                          description: snapshot.data[index].description);
                    },
                  );
                }
              }
              return widget;
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          onPressed: () {},
          tooltip: "Add Your Project",
          child: Icon(Icons.add_box_outlined),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}

class ProjectCard extends StatelessWidget {
  final String name;
  final String id;
  final String description;
  const ProjectCard({
    Key key,
    this.name,
    this.id,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      color: Colors.lightBlue[50],
      child: ListTile(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        title: Text(
          this.name,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        onTap: () {},
        hoverColor: Colors.lightGreenAccent[100],
        leading: CircleAvatar(
          backgroundColor: Colors.lightBlue[100],
          child: Text(this.id, style: TextStyle(color: Colors.black)),
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 15),
          child: Text(this.description,
              style: TextStyle(color: Colors.black, fontSize: 16)),
        ),
      ),
    );
  }
}

/* PROVIDER (FUTURE PROVIDER?)
CREATE provider on the top(wrap metrial app) "changenotifierprovider<class> , builder:  (context) => new Class()" 
** if u have many providers u can use MultiProvider
create class Data extend changenotifier create method to change the variable and run changenotifier()
provider.of<datA>(context, listener: false?).variable;
if we want something get update we can warp it with consumer<data> builder: context, data,child ) return listtile using data.data
*/
