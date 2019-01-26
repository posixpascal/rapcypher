import 'package:rap_cypher/config.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Future<http.Response> fetchPost() {
    return http.get('${Config.API_ENDPOINT}/');
  }
}
