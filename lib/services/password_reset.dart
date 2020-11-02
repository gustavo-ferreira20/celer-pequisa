// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:celer_pesquisa_app/services/user_info.dart';
//
// class PasswordReset {
//   static Future<User> passwordReset(String email) async {
//     final baseUrl = 'https://iopoc.celer.ind.br:8080/api/v1/';
//
//     var url = '$baseUrl/auth/user/password_reset/';
//
//     //Content-Type
//     var header = {
//       "Content-Type": "application/json",
//       "Authorization": "Token <TOKEN>"
//     };
//     //Body
//     Map params = {"email": email};
//
//     var user;
//
//     //Passando o Map para Json
//     var _body = json.encode(params);
//
//     var response = await http.post(url, headers: header, body: _body);
//
//     print('Response status: ${response.statusCode}');
//
//     Map mapResponse = json.decode(response.body);
//     if (response.statusCode == 200) {
//       user = User.fromJson(mapResponse);
//     } else {
//       user = null;
//     }
//     return user;
//   }
// }
