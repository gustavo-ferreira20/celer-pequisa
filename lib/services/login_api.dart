import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:celer_pesquisa_app/services/user_info.dart';

class LoginApi {
  static Future<UserInfo> login(String username, String password) async {
    var baseUrl = 'https://iopoc.celer.ind.br:8080/api/v1/';
    var url = '$baseUrl/auth/user/login/';
    var header = {
      "Content-Type": "application/json",
      "Authorization": "Token <TOKEN>"
    };

    Map params = {"username": username, "password": password};
    var userInfo;
    var _body = jsonEncode(params);
    var response = await http.post(url, headers: header, body: _body);

    print('Response status: ${response.statusCode}');

    Map mapResponse = json.decode(response.body);

    // String token = mapResponse['token'];
    // String fullName = mapResponse["user"]["fullName"];
    if (response.statusCode == 200) {
      userInfo = UserInfo.fromJson(mapResponse);
    } else {
      userInfo = null;
    }
    return userInfo;
  }
}
