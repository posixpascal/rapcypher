import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:rap_cypher/actions/profiles.dart';
import 'package:rap_cypher/models/profile.dart';
import 'package:rap_cypher/state.dart';
import 'package:rap_cypher/widgets/profiles/profile.dart';

class ProfilesState extends State<ProfilesPage> {
  @override
  Widget build(BuildContext context) {
    StoreProvider.of<AppState>(context).dispatch(GetProfilesAction);

    return new Column(
        // add children to the column
        children: <Widget>[
          SingleChildScrollView(
              child: Column(children: <Widget>[
            Expanded(
                flex: 0,
                child: StoreConnector<AppState, List<Profile>>(
                    converter: (store) => store.state.profiles,
                    builder: (_, profiles) {
                      return GridView.count(
                          primary: false,
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(20.0),
                          crossAxisSpacing: 10.0,
                          crossAxisCount: 2,
                          children: profiles.map((Profile profile) {
                            return ProfileCard(
                                profile: profile, textColor: Colors.black);
                          }).toList());
                    }))
          ]))
        ]);
  }
}

class ProfilesPage extends StatefulWidget {
  static const String routeName = "/profiles";

  @override
  ProfilesState createState() {
    return new ProfilesState();
  }
}
