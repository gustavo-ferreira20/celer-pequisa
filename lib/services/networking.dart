import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:shared_preferences/shared_preferences.dart';

class NetworkHelper {
  Future getData() async {
    try {
      // var prefs = await SharedPreferences.getInstance();
      // String token = (prefs.getString("tokenjwt") ?? '');
      //
      // print('token: $token');
      //
      // var header = {
      //   "Content-Type": "application/json",
      //   "Authorization": "Bearer $token",
      // };

      // http.Response response = await http
      //     .get('https://api.trovi.com.br/v1/questions/', headers: header);
      http.Response response =
          await http.get('https://api.trovi.com.br/v1/questions/');

      if (response.statusCode == 200) {
        //String data = response.body;
        var data = response.bodyBytes;

        //return jsonDecode(data);
        return jsonDecode(utf8.decode(data));
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print('error: $e');
      return Center(child: Text("Erro ao carregar dados!!"));
    }
  }
}

// questionText = decodedData[2]['name'];
// choices = decodedData[2]['choices'][0]['name'];
//var choices = jsonDecode(data)[2]['choices'];
// list choiceList = jsonDecode(data)[questionNumber]['choices'] --> list of choices
// eu posso loopar no choiceList e pegar cada jsonDecode(data)[questionNumber]['choices'][i]['name']
