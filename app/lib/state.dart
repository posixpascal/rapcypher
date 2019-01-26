import 'package:rap_cypher/models/profile.dart';

class AppState {
  List<Profile> _profiles = [];
  List<Profile> get profiles => _profiles;

  AppState(this._profiles);
}
