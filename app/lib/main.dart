import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:rap_cypher/reducers/cypher.dart';
import 'package:rap_cypher/screens/login.dart';
import 'package:rap_cypher/screens/profile.dart';
import 'package:rap_cypher/screens/profiles.dart';
import 'package:rap_cypher/screens/recording.dart';
import 'package:rap_cypher/screens/register.dart';
import 'package:rap_cypher/screens/settings.dart';
import 'package:rap_cypher/state.dart';
import 'package:rap_cypher/widgets/forms/login.dart';
import 'package:rap_cypher/widgets/tabs/cypher_tabs.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

void main() {
  final store = new Store<AppState>(cypherReducer, initialState: AppState([]), middleware: [thunkMiddleware]);

  runApp(CypherApp(store: store));
}

class CypherApp extends StatelessWidget {
  final Store<AppState> store;

  CypherApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
          ),
          home: CypherAppPage(title: 'Kuchen Cypher', store: store),
          routes: <String, WidgetBuilder>{
            LoginPage.routeName: (BuildContext context) => new LoginPage(),
            ProfilePage.routeName: (BuildContext context) => new ProfilePage(),
            ProfilesPage.routeName: (BuildContext context) =>
                new ProfilesPage(),
            RegisterPage.routeName: (BuildContext context) =>
                new RegisterPage(),
            SettingsPage.routeName: (BuildContext context) =>
                new SettingsPage(),
            RecordingPage.routeName: (BuildContext context) =>
                new RecordingPage(),
          },
        ));
  }
}

class CypherAppPage extends StatefulWidget {
  CypherAppPage({Key key, this.title, this.store}) : super(key: key);
  final Store<AppState> store;
  final String title;

  @override
  CypherAppPageState createState() => CypherAppPageState();
}

class CypherAppPageState extends State<CypherAppPage> {
  int tabIndex = 0;

  Widget activeWidget() {
    switch (tabIndex) {
      case 0:
        return LoginForm();
      case 1:
        return ProfilesPage();
      default:
        return LoginForm();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[activeWidget()],
        ),
      ),
      bottomNavigationBar: CypherTabPage(this),
    );
  }
}
