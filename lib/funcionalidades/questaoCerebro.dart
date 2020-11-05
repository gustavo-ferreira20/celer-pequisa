// import 'dart:convert';
// import 'package:celer_pesquisa_app/funcionalidades/estrutura_das_questoes.dart';
// import 'package:celer_pesquisa_app/funcionalidades/question_model.dart';
// import 'package:celer_pesquisa_app/services/quiz_api.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import 'package:celer_pesquisa_app/funcionalidades/question_model.dart';
//
// class QuestaoCerebro {
//   int _questionNumber = 0;
//
//   // List<Question> _questionBank = [
//   //   Question('Some cats are actually allergic to humans',
//   //       a: ['sim', 'nao', 'talvez']),
//   //   Question('You can lead a cow down stairs but not up stairs.',
//   //       a: ['sim', 'nao', 'aaaaaa']),
//   //   Question(
//   //     'Questao sem alternativa',
//   //     a: [],
//   //   ),
//   //   Question('Approximately one quarter of human bones are in the feet.',
//   //       a: ['sim', 'ssssssss', 'talvez', 'uuu']),
//   //   Question('TEssssssssss', a: [
//   //     'foi',
//   //     'ssssssss',
//   //   ]),
//   //   Question('AAAAAAAAAA', a: ['sim', 'ssssssss', 'talvez', 'uuu', 'yyyyy']),
//   // ];
//   _fetchQuestions() async {
//     List<QuestionModel> _questionBank = await QuizApi.getQuestions();
//     return _questionBank;
//   }
//
//   // void nextQuestion() {
//   //   if (_questionNumber < _questionBank.length - 1) {
//   //     _questionNumber++;
//   //   }
//   // }
//
//   void nextQuestion() {
//     if (_questionNumber < _fetchQuestions().length - 1) {
//       _questionNumber++;
//     }
//   }
//
//   String getQuestionText() {
//     return _fetchQuestions()[_questionNumber].name;
//   }
//
//   //
//   // List<String> getAnswer() {
//   //   return _questionBank[_questionNumber].questionAnswer;
//   // }
// //=====================
// //   String getQuestionText() {
// //     return _questionBank[_questionNumber].name;
// //   }
//
//   // List<String> getAnswer() {
//   //   return _questionBank[_questionNumber].choices['name'];
//   // }
//
//   bool isFinished() {
//     if (_questionNumber >= _fetchQuestions().length - 1) {
//       print('Now returning true');
//       return true;
//     } else {
//       return false;
//     }
//   }
//
//   void reset() {
//     _questionNumber = 0;
//   }
// }
