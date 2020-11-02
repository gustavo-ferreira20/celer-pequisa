import 'package:celer_pesquisa_app/telas/perguntas_tela.dart';
import 'package:flutter/material.dart';
import 'package:celer_pesquisa_app/constantes.dart';
import 'package:celer_pesquisa_app/utilidades/buttonBaixo.dart';
import 'package:celer_pesquisa_app/funcionalidades/questoes_data.dart';

class IdentificacaoQuiz extends StatefulWidget {
  static const String id = 'identificacao_quiz';

  @override
  _IdentificacaoQuizState createState() => _IdentificacaoQuizState();
}

class _IdentificacaoQuizState extends State<IdentificacaoQuiz> {
  // Loop para imprimir as perguntas
  List<Column> imprimindoQuestoes() {
    List<Column> cadaPergunta = [];
    for (int i = 0; i < perguntas.length; i++) {
      String pergunta = perguntas[i];
      var novaPergunta = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: kTextCorEscuro,
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: InputDecoration(
                hintText: pergunta,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kButtonCor1, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kButtonCor1, width: 2.0),
                ),
              ),
            ),
          ),
        ],
      );
      cadaPergunta.add(novaPergunta);
    }
    return cadaPergunta;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Identificação',
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
        children: [
          ...imprimindoQuestoes(),
          Expanded(
              child: SizedBox(
            height: 2.0,
          )),
          ButtonBaixo(
            buttonTitle: 'PRÓXIMA',
            onTap: () {
              // Create a empty array with the questions Struct to store the full quiz
              Navigator.pushNamed(context, PerguntasTela.id);
            },
          )
        ],
      ),
    );
  }
}
