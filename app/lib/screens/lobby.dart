import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'dart:convert';

class GamePage extends StatefulWidget {
  static const String routeName = "/game";
  int gameId;

  GamePage(int _id){
    gameId = _id;
  }

  @override
  GameState createState() => GameState(gameId);
}

class GameState extends State<GamePage> {
  String status = "Init...";
  IOWebSocketChannel channel;
  List<CameraDescription> cameras;
  CameraController cameraController;
  StreamBuilder streamBuilder;
  String token;

  GameState(int id) {
    availableCameras().then((List<CameraDescription> cameras) {
      CameraController _cameraController =
          CameraController(cameras[0], ResolutionPreset.medium);
      _cameraController.initialize().then((_) {
        if (!mounted) {
          return;
        }
        cameraController = _cameraController;
        setState(() {});
      });
    });

    // Handle server connection
    channel = IOWebSocketChannel.connect("ws://192.168.112.131:8080");

    //
    channel.stream.listen((data) {
      data = jsonDecode(data);
      List<String> parts = data["action"].split(":");
      String action = parts[0];
      String subaction = parts[1];

      switch (action){
        case "cypher":
          switch (subaction){
            case "welcome":
              token = data["token"];
              channel.sink.add(jsonEncode({
                "action": "cypher:welcome",
                "token": token
              }));
              break;

            case "accept":
              String nextAction = data["next_action"];
              channel.sink.add(jsonEncode({
                "action": "room:" + nextAction,
                "token": token,
              }));
              
              break;
          }
          break;
        case "game":
          switch (subaction){
            case "new":
              print("new game");
              break;
            case "join":
              print("join game");
              break;
          }
      }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double size = 400.0;

    return Scaffold(
        appBar: AppBar(
          title: Text("Battle Cypher"),
        ),
        body: new Container(
            child: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      channel != null
                          ? Text(status)
                          : Text("Connecting..."),
                    new Center(
                        child: ClipRect(
                            child: FittedBox(
                      alignment: Alignment.center,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: cameraController != null
                            ? Container(
                                width: size,
                                height: size / cameraController.value.aspectRatio,
                                child: CameraPreview(
                                    cameraController), // this is my CameraPreview
                              )
                            : Text("Loading"),
                      ),
                    ))),
                  ]))));
  }
}
