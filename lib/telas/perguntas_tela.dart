// import 'package:celer_pesquisa_app/telas/iniciar_quiz_tela.dart';
// import 'package:flutter/material.dart';
// import 'package:celer_pesquisa_app/constantes.dart';
// import 'package:celer_pesquisa_app/utilidades/buttonBaixo.dart';
// import 'package:celer_pesquisa_app/funcionalidades/questoes_data.dart';
//
// class PerguntasTela extends StatefulWidget {
//   static const String id = 'perguntas';
//
//   @override
//   _PerguntasTelaState createState() => _PerguntasTelaState();
// }
//
// class _PerguntasTelaState extends State<PerguntasTela> {
//   var pressed = false;
//   String userResposta;
//
//   void mudarCor(String userChoice) {
//     setState(() {
//       pressed = true;
//     });
//   }
//
//   List<Widget> imprimindoRespostas() {
//     List<Widget> cadaResposta = [];
//     for (int i = 0; i < respostas.length; i++) {
//       String resposta = respostas[
//           i]; // esse 'resposta' que eu vou pegar mais tarde para guardar a resposta do usuario
//       var novaResposta = Padding(
//         padding: EdgeInsets.symmetric(vertical: 16.0),
//         child: Material(
//           elevation: 5.0,
//           color: pressed ? kButtonCor2 : kButtonCor1,
//           borderRadius: BorderRadius.circular(30.0),
//           child: FlatButton(
//             onPressed: () {
//               userResposta = resposta;
//               print(resposta);
//               mudarCor(userResposta);
//               /*
//             Vou ter que fazer um loop para gerar os buttons dinamicamente. Apos isso armazenar a alternativa do usuario,
//             mas nao mudar de pagina, pois o button "encerrar Questionario" fara isso.
//             int checkAnswer(bool userPickedAnswer) {
//     bool userAnswer = userPickedAnswer;
//
//     return userAnswer
//     }
//     Logo, se usuario clicar alternativa 'A', eu passo checkAnswer(0), pois 0 é o primeiro index do array dentro da api.
//     Assim eu passo userAnswer para o button "encerrar Questionario".
//              */
//             },
//             minWidth: 200.0,
//             height: 42.0,
//             child: Text(
//               resposta,
//               style: kTextCorClaro,
//             ),
//           ),
//         ),
//       );
//       cadaResposta.add(novaResposta);
//     }
//     return cadaResposta;
//   }
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
//         children: [
//           Expanded(
//             flex: 3,
//             child: Container(
//               padding: EdgeInsets.all(15.0),
//               alignment: Alignment.bottomLeft,
//               child: Text(
//                 'Alguma pergunta aqui:',
//                 style: kTextCorEscuro2,
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 6,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   ...imprimindoRespostas(),
//                 ],
//               ),
//             ),
//           ),
//           ButtonBaixo(
//             buttonTitle: 'ENCERRAR QUESTIONÁRIO',
//             onTap: () {
//               print(
//                   userResposta); // eu vou add essa resposta no array e salvar local
//               // Create a empty array with the questions Struct to store the full quiz
//               Navigator.pushNamed(context, IniciarQuiz.id);
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
