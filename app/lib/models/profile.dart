import 'package:rap_cypher/config.dart';

class Profile {
  final int id;
  final String rapperName;
  final String favoritePunchline;
  final String avatar;

  Profile({this.id, this.rapperName, this.favoritePunchline, this.avatar});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
        id: json['id'],
        rapperName: json['rapper_name'],
        favoritePunchline: json['favorite_punchline'],
        avatar: "${Config.API_HOST}${json['avatar']}");
  }
}
