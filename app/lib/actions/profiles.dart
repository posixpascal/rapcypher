import 'package:rap_cypher/models/profile.dart';
import 'package:rap_cypher/services/profiles.dart';
import 'package:rap_cypher/state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class SetProfilesAction {
  List<Profile> _profiles;

  List<Profile> get profiles => this._profiles;

  SetProfilesAction(this._profiles);
}

ThunkAction<AppState> GetProfilesAction = (Store<AppState> store) async {
  List<Profile> profiles = await ProfileService().fetchProfiles();
  store.dispatch(
      new SetProfilesAction(
          profiles
      )
  );
};


