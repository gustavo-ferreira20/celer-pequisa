import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:celer_pesquisa_app/constantes.dart';
import 'package:celer_pesquisa_app/utilidades/buttonBaixo.dart';
import 'package:celer_pesquisa_app/funcionalidades/question_model.dart';

import 'package:celer_pesquisa_app/funcionalidades/questaoCerebro.dart';

// QuestaoCerebro questaoCerebro = QuestaoCerebro();

class QuestionarioQuiz extends StatefulWidget {
  static const String id = 'identificacao_quiz';
  QuestionarioQuiz({this.questionsData});
  final questionsData;

  @override
  _QuestionarioQuizState createState() => _QuestionarioQuizState();
}

class _QuestionarioQuizState extends State<QuestionarioQuiz> {
  // Armazenar o quiz completo dentro dessa lista
  List variosQuizDoUser = [];
  // Um quiz individual será armazenado aqui
  List IndividualQuiz = [];
  var userChoice;
  var questionText;
  List<dynamic> choicesText;
  int questionNumber = 0;

  @override
  void initState() {
    super.initState();
    //print(widget.questionsData);
    updateUI(widget.questionsData);
    //print(questionBankLength());
    //print(getChoicesList());
  }

  void updateUI(dynamic questionDataApi) {
    questionText = questionDataApi[questionNumber]['name'];
    choicesText = widget.questionsData[questionNumber]['choices'];
  }

  int questionBankLength() {
    final questionsLength = List<QuestionModel>();
    for (Map map in widget.questionsData) {
      QuestionModel q = QuestionModel.fromJson(map);
      questionsLength.add(q);
    }
    return questionsLength.length;
  }

  void nextQuestion() {
    if (questionNumber < questionBankLength() - 1) {
      questionNumber++;
      updateUI(widget.questionsData);
    }
  }

// Print todos os field placeHolder
  // List<String> listFieldPlaceholder() {
  //   final allChoices = List<String>();
  //   for (Map map in widget.questionsData) {
  //     QuestionModel c = QuestionModel.fromJson(map);
  //     allChoices.add(c.fieldPlaceholder);
  //   }
  //   return allChoices;
  // }

  List<dynamic> getChoices() {
    var choices = [];
    for (int i = 0; i < choicesText.length; i++) {
      var eachChoice = choicesText[i]['name'];

      var newChoice = Expanded(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: FlatButton(
            color: Colors.red,
            child: Text(
              eachChoice,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              //The user picked this button.
              userChoice = eachChoice;
            },
          ),
        ),
      );
      choices.add(newChoice);
    }
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Questionário',
          style: kTextCorEscuro,
        ),
        bottom: PreferredSize(
            child: Container(
              color: kButtonCor1,
              height: 0.5,
            ),
            preferredSize: Size.fromHeight(4.0)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 50.0,
            color: kButtonCor2,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  questionText,
                  //TODO: STATE BEFORE CHANGES BELOW - ONLY COMMENT OUT TO BACK TO NORMAL
                  //questaoCerebro.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          //...displayChoices(),
          ...getChoices(),
          ButtonBaixo(
            buttonTitle: 'PRÓXIMA',
            onTap: () {
              // Create a empty array with the questions Struct to store the full quiz
              //Navigator.pushNamed(context, PerguntasTela.id);
              print(userChoice);
              setState(() {
                nextQuestion();
                //print(questaoCerebro.getAnswer().length);
              });
            },
          )
        ],
      ),
    );
  }
}
