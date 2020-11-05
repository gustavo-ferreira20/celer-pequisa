import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  Future getData() async {
    http.Response response =
        await http.get('https://api.trovi.com.br/v1/questions/');

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}

// questionText = decodedData[2]['name'];
// choices = decodedData[2]['choices'][0]['name'];
//var choices = jsonDecode(data)[2]['choices'];
// list choiceList = jsonDecode(data)[questionNumber]['choices'] --> list of choices
// eu posso loopar no choiceList e pegar cada jsonDecode(data)[questionNumber]['choices'][i]['name']
