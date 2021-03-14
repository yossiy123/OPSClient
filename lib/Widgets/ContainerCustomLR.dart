import 'package:flutter/material.dart';
// LOGIN& RESGITER CONTAINER DESIGN

class CustomContainerLR extends StatelessWidget {
  const CustomContainerLR({
    Key key,
    this.childrens,
  }) : super(key: key);

  final List<Widget> childrens;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: 25), // for padding the textfields
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(
                0.8, 0.0), // 10% of the width, so there are ten blinds.
            colors: [
              Colors.lightBlue[100],
              Colors.lightGreen[100]
            ], // red to yellow
            tileMode: TileMode.repeated,
          ),
        ),
        width: MediaQuery.of(context).size.width * 0.30,
        height: MediaQuery.of(context).size.height * 0.50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: childrens,
        ),
      ),
    );
  }
}
