import 'package:flutter/material.dart';
import 'package:rap_cypher/widgets/forms/login.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return new Container(
      // Center the content
      child: new Center(
        child: Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: LoginForm()),
      ),
    );
  }
}
