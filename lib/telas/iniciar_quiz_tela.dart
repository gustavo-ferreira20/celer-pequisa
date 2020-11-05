import 'package:celer_pesquisa_app/telas/questionario.dart';
import 'package:flutter/material.dart';
import 'package:celer_pesquisa_app/utilidades/buttonBaixo.dart';
import 'package:celer_pesquisa_app/constantes.dart';
import 'package:celer_pesquisa_app/utilidades/card_reutilizavel.dart';
import 'package:celer_pesquisa_app/telas/loading_tela.dart';

class IniciarQuiz extends StatefulWidget {
  static const String id = 'iniciar_quiz';

  @override
  _IniciarQuizState createState() => _IniciarQuizState();
}

class _IniciarQuizState extends State<IniciarQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardReutilizavel(
                  colour: kCor5,
                  msg: "Você tem 3 questionários para sincronizar com a nuvem!",
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    elevation: 5.0,
                    color: kButtonCor1,
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      onPressed: () {
                        // Send quizzes to the cloud
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Sincronizar Agora',
                        style: kTextCorClaro,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonBaixo(
            buttonTitle: 'INICIAR QUIZ',
            onTap: () {
              // Create a empty array with the questions Struct to store the full quiz

              Navigator.pushNamed(context, LoadingScreen.id);
            },
          )
        ],
      ),
    );
  }
}
