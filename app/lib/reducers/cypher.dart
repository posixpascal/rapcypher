import 'package:flutter_redux/flutter_redux.dart';
import 'package:rap_cypher/actions/profiles.dart';
import 'package:rap_cypher/state.dart';
import 'package:redux/redux.dart';

AppState cypherReducer(AppState prev, dynamic action){
  if (action is SetProfilesAction){
    AppState newState = new AppState(action.profiles);
    return newState;
  }
  return prev;
}
