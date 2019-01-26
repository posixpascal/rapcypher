import 'package:flutter/material.dart';
import 'package:rap_cypher/main.dart';


class CypherTabPage extends StatefulWidget {
  CypherAppPageState root;
  CypherTabPage(CypherAppPageState root){
    this.root = root;
  }

  @override
  CypherTabBar createState() { return new CypherTabBar(root); }
}

class CypherTabBar extends State<CypherTabPage> {
  CypherAppPageState root;
  CypherTabBar(dynamic root){
    this.root = root;
  }

  @override
  Widget build(BuildContext context){
    return BottomNavigationBar(
      currentIndex: root.tabIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.deepOrange), title: Text('Home', style: TextStyle(color: Colors.deepOrange))),
        BottomNavigationBarItem(icon: Icon(Icons.record_voice_over, color: Colors.deepOrange), title: Text('Community', style: TextStyle(color: Colors.deepOrange))),
        BottomNavigationBarItem(icon: Icon(Icons.mic, color: Colors.deepOrange), title: Text('Record', style: TextStyle(color: Colors.deepOrange))),
        BottomNavigationBarItem(icon: Icon(Icons.attach_money, color: Colors.deepOrange), title: Text('Profile', style: TextStyle(color: Colors.deepOrange))),
        BottomNavigationBarItem(icon: Icon(Icons.settings, color: Colors.deepOrange), title: Text('Settings', style: TextStyle(color: Colors.deepOrange)))
      ],
      fixedColor: Colors.deepOrange,
      onTap: (index) {
        root.tabIndex = index;
        root.setState(() {});
      },
    );
  }
}
