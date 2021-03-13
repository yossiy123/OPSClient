import 'package:flutter/material.dart';

class AddProjectDialog extends StatelessWidget {
  const AddProjectDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text("Add Open Source Project"),
      content: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.70,
            child: Column(children: [
              TextFormField(
                onChanged: (value) {
                  // get name
                },
                decoration: InputDecoration(
                    labelText: "Title", icon: Icon(Icons.title)),
              ),
              TextFormField(
                onChanged: (value) {
                  // get
                },
                maxLines: 50,
                decoration: InputDecoration(
                    labelText: "Info", icon: Icon(Icons.info_outline)),
              ),
            ]),
          ),
        ),
      ),
      actions: [
        ElevatedButton(
            child: Text("Submit"),
            onPressed: () {
              // your code

              Navigator.pop(context);
            })
      ],
    );
  }
}
