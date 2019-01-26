import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // AppBar
      appBar: new AppBar(
        // Title
        title: new Text("Home Page"),
        // App Bar background color
        backgroundColor: Colors.red,
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[


            ],
          ),
        ),
      ),
    );
  }
}
