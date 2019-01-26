import 'package:flutter/material.dart';
import 'package:rap_cypher/models/profile.dart';

class ProfileCard extends StatelessWidget {
  final Profile profile;
  final textColor;

  ProfileCard({this.profile, this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch, // horizontal
      mainAxisAlignment: MainAxisAlignment.start, // vertical
      children: <Widget>[
        Image.network(profile.avatar, fit: BoxFit.cover, height: 100.0),
        ProfileCardFooter(profile)
      ],
    ));
  }
}

Widget ProfileCardFooter(Profile profile) {
  return Padding(
    padding: const EdgeInsets.only(left: 10.0, top: 6.0, right: 10.0),
    child:
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(
        "prime gdz",
        style: TextStyle(
            fontFamily: "bangers",
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
            color: Colors.black),
      ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("0", style: TextStyle(color: Colors.deepOrangeAccent)),
              Icon(Icons.mic, size: 16.0, color: Colors.deepOrangeAccent),
              SizedBox(width: 15.0),
              Text("0", style: TextStyle(color: Colors.deepOrangeAccent)),
              Icon(Icons.people, size: 16.0, color: Colors.deepOrangeAccent),
              SizedBox(width: 15.0),
              Text("0", style: TextStyle(color: Colors.deepOrangeAccent)),
              Icon(Icons.audiotrack, size: 16.0, color: Colors.deepOrangeAccent),
            ],
          )
    ]),
  );
}
