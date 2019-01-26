import 'package:flutter/material.dart';
import 'package:rap_cypher/strings.dart';

Widget LoginForm() {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: new Column(
      // Center content in the column
      mainAxisAlignment: MainAxisAlignment.center,
      // add children to the column
      children: <Widget>[
        TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: "oder Rapper Name",
              labelText: "E-mail...",
            )
        ),
        TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              icon: Icon(Icons.lock),
              labelText: 'Passwort',
            )
        ),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: new MaterialButton(
            child: new Text(
              Strings.loginFormCtaText,
              style: new TextStyle(color: Colors.white),
            ),
            color: Colors.deepOrange,
            onPressed: () {},
          ),
        )
      ],
    ),
  );
}
