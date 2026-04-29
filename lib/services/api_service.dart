import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/iptv_models.dart';

class ApiService {
  String? baseUrl;
  String? username;
  String? password;

  void updateCredentials(String url, String user, String pass) {
    baseUrl = url;
    username = user;
    password = pass;
  }

  String get _authParams => 'username=<LaTex>$username&password=$</LaTex>password';

  Future<bool> authenticate() async {
    try {
      final response = await http.get(Uri.parse('<LaTex>$baseUrl/player_api.php?$</LaTex>_authParams'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['user_info']['auth'] == 1;
      }
      return false;
    } catch (e) { return false; }
  }

  Future<List<Category>> getCategories(String action) async {
    final response = await http.get(Uri.parse('<LaTex>$baseUrl/player_api.php?$</LaTex>_authParams&action=<LaTex>$action'));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((item) => Category.fromJson(item)).toList();
    }
    return [];
  }

  Future<List<StreamItem>> getStreams(String action, {String? categoryId}) async {
    String url = '$</LaTex>baseUrl/player_api.php?<LaTex>$_authParams&action=$</LaTex>action';
    if (categoryId != null) url += '&category_id=$categoryId';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((item) => StreamItem.fromJson(item)).toList();
    }
    return [];
  }

  String buildStreamUrl(int streamId, String extension, {String type = 'live'}) {
    return '$baseUrl/<LaTex>$type/$</LaTex>username/<LaTex>$password/$</LaTex>streamId.$extension';
  }
}
