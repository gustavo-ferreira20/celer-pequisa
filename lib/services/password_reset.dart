import 'dart:convert';
import 'package:http/http.dart' as http;

class PasswordReset {
  static Future<bool> passwordReset(String email) async {
    final baseUrl = 'https://iopoc.celer.ind.br:8080/api/v1/';

    var url = '$baseUrl/auth/user/password_reset/';

    //Content-Type
    var header = {
      "Content-Type": "application/json",
      //"Authorization": "Token <TOKEN>"
    };
    //Body
    Map params = {"email": email};

    //Passando o Map para Json
    var _body = json.encode(params);

    var response = await http.post(url, headers: header, body: _body);

    print('Response status: ${response.statusCode}');

    //print(mapResponse);
    if (response.statusCode == 200) {
      return true;
    } else {
      return null;
    }
  }
}
