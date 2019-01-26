
import 'dart:convert';

import 'package:rap_cypher/config.dart';
import 'package:rap_cypher/models/profile.dart';
import 'package:http/http.dart' as http;

class ProfileService {
  Future<List<Profile>> fetchProfiles() async {
    final response = await http.get("${Config.API_ENDPOINT}/users/");

    if (response.statusCode == 200) {
      List<dynamic> profiles = json.decode(response.body);
      // If server returns an OK response, parse the JSON
      return profiles.map((profile) => Profile.fromJson(profile)).toList();
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load profiles');
    }
  }
}
