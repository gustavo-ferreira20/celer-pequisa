// //import 'package:celer_pesquisa_app/telas/perguntas_tela.dart';
// import 'package:flutter/material.dart';
// import 'package:celer_pesquisa_app/constantes.dart';
// import 'package:celer_pesquisa_app/utilidades/buttonBaixo.dart';
// import 'package:celer_pesquisa_app/funcionalidades/questaoCerebro.dart';
// import 'package:celer_pesquisa_app/funcionalidades/estrutura_das_questoes.dart';
// //import 'package:celer_pesquisa_app/funcionalidades/quiz_api.dart';
//
// QuestaoCerebro questaoCerebro = QuestaoCerebro();
//
// List teste = ['um', 'dois'];
//
// class questionarioQuiz extends StatefulWidget {
//   static const String id = 'identificacao_quiz';
//
//   @override
//   _questionarioQuizState createState() => _questionarioQuizState();
// }
//
// class _questionarioQuizState extends State<questionarioQuiz> {
//   // Armazenar o quiz completo dentro dessa lista
//   List variosQuizDoUser = [];
//   // Um quiz individual será armazenado aqui
//   List IndividualQuiz = [];
//   var userChoice;
//
//   Expanded questionTextField(double opacity) {
//     var textField = Expanded(
//       child: Opacity(
//         opacity: opacity,
//         child: TextField(
//           style: kTextCorEscuro,
//           decoration: InputDecoration(
//               labelStyle: TextStyle(
//                 color: kButtonCor2,
//               ),
//               contentPadding:
//                   EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(32.0)),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: kButtonCor1, width: 1.0),
//                 borderRadius: BorderRadius.all(Radius.circular(32.0)),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: kButtonCor1, width: 2.0),
//                 borderRadius: BorderRadius.all(Radius.circular(32.0)),
//               )),
//         ),
//       ),
//     );
//
//     return textField;
//   }
//
//   // dynamic getChoices() {
//   //   List<Widget> choices = [];
//   //
//   //   if (questaoCerebro.getAnswer().length == null) {
//   //     var noChoice = Expanded(
//   //       child: TextField(
//   //         style: kTextCorEscuro,
//   //         decoration: InputDecoration(
//   //             labelStyle: TextStyle(
//   //               color: kButtonCor2,
//   //             ),
//   //             contentPadding:
//   //                 EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//   //             border: OutlineInputBorder(
//   //               borderRadius: BorderRadius.all(Radius.circular(32.0)),
//   //             ),
//   //             enabledBorder: OutlineInputBorder(
//   //               borderSide: BorderSide(color: kButtonCor1, width: 1.0),
//   //               borderRadius: BorderRadius.all(Radius.circular(32.0)),
//   //             ),
//   //             focusedBorder: OutlineInputBorder(
//   //               borderSide: BorderSide(color: kButtonCor1, width: 2.0),
//   //               borderRadius: BorderRadius.all(Radius.circular(32.0)),
//   //             )),
//   //       ),
//   //     );
//   //     return noChoice;
//   //   } else {
//   //     for (int i = 0; i < questaoCerebro.getAnswer().length; i++) {
//   //       String eachAnswer = questaoCerebro.getAnswer()[i];
//   //       var newChoice = Expanded(
//   //         child: Padding(
//   //           padding: EdgeInsets.all(15.0),
//   //           child: FlatButton(
//   //             color: Colors.red,
//   //             child: Text(
//   //               eachAnswer,
//   //               style: TextStyle(
//   //                 fontSize: 20.0,
//   //                 color: Colors.white,
//   //               ),
//   //             ),
//   //             onPressed: () {
//   //               //The user picked this button.
//   //               userChoice = eachAnswer;
//   //             },
//   //           ),
//   //         ),
//   //       );
//   //       choices.add(newChoice);
//   //     }
//   //     return choices;
//   //   }
//   // }
//
//   List<Widget> getChoices() {
//     List<Widget> choices = [];
//     for (int i = 0; i < questaoCerebro.getAnswer().length; i++) {
//       String eachAnswer = questaoCerebro.getAnswer()[i];
//       var newChoice = Expanded(
//         child: Padding(
//           padding: EdgeInsets.all(15.0),
//           child: FlatButton(
//             color: Colors.red,
//             child: Text(
//               eachAnswer,
//               style: TextStyle(
//                 fontSize: 20.0,
//                 color: Colors.white,
//               ),
//             ),
//             onPressed: () {
//               //The user picked this button.
//               userChoice = eachAnswer;
//             },
//           ),
//         ),
//       );
//       choices.add(newChoice);
//     }
//     return choices;
//   }
//
//   // displayChoices() {
//   //   if (questaoCerebro.getAnswer() == null) {
//   //     return questionTextField();
//   //   } else {
//   //     return getChoices();
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Questionário',
//           style: kTextCorEscuro,
//         ),
//         bottom: PreferredSize(
//             child: Container(
//               color: kButtonCor1,
//               height: 0.5,
//             ),
//             preferredSize: Size.fromHeight(4.0)),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: FlatButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Icon(
//             Icons.arrow_back_ios,
//             size: 50.0,
//             color: kButtonCor2,
//           ),
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Expanded(
//             flex: 5,
//             child: Padding(
//               padding: EdgeInsets.all(10.0),
//               child: Center(
//                 child: Text(
//                   //TODO: STATE BEFORE CHANGES BELOW - ONLY COMMENT OUT TO BACK TO NORMAL
//                   questaoCerebro.getQuestionText(),
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 25.0,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           // Container(child: questaoCerebro.getAnswer().length
//           //     ? questionTextField(1.0)
//           //     : questionTextField(0.0),),
//           //...displayChoices(),
//           ...getChoices(),
//           ButtonBaixo(
//             buttonTitle: 'PRÓXIMA',
//             onTap: () {
//               // Create a empty array with the questions Struct to store the full quiz
//               //Navigator.pushNamed(context, PerguntasTela.id);
//               print(userChoice);
//               setState(() {
//                 //print(questaoCerebro.getAnswer().length);
//                 questaoCerebro.nextQuestion();
//               });
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
