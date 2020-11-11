import 'package:flutter/material.dart';
import 'package:celer_pesquisa_app/services/networking.dart';
import 'package:celer_pesquisa_app/telas/questionario.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  static const String id = 'loading_tela';
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getQuestionsData();
  }

  getQuestionsData() async {
    NetworkHelper networkHelper = NetworkHelper();
    var questionData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return QuestionarioQuiz(
        questionsData: questionData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.red,
          size: 100.0,
          duration: Duration(seconds: 2),
        ),
      ),
    );
  }
}
