import 'package:celer_pesquisa_app/telas/loading_tela.dart';
import 'package:celer_pesquisa_app/telas/questionario.dart';
import 'package:celer_pesquisa_app/telas/iniciar_quiz_tela.dart';
import 'package:celer_pesquisa_app/telas/perguntas_tela.dart';
import 'package:flutter/material.dart';
import 'package:celer_pesquisa_app/telas/bemvindo_tela.dart';
import 'package:celer_pesquisa_app/telas/login_tela.dart';
import 'package:celer_pesquisa_app/telas/recuperar_senha_tela.dart';

void main() => runApp(CelerApp());

class CelerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
          textTheme: TextTheme(
        bodyText2: TextStyle(color: Colors.black54),
      )),
      initialRoute: BemVindoTela.id,
      routes: {
        BemVindoTela.id: (context) => BemVindoTela(),
        LoginTela.id: (context) => LoginTela(),
        RecuperarSenhaTela.id: (context) => RecuperarSenhaTela(),
        IniciarQuiz.id: (context) => IniciarQuiz(),
        LoadingScreen.id: (context) => LoadingScreen(),
        QuestionarioQuiz.id: (context) => QuestionarioQuiz(),
        //PerguntasTela.id: (context) => PerguntasTela(),
      },
    );
  }
}
