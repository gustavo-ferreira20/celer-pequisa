import 'package:celer_pesquisa_app/telas/iniciar_quiz_tela.dart';
import 'package:flutter/material.dart';
import 'package:celer_pesquisa_app/constantes.dart';
import 'package:celer_pesquisa_app/utilidades/buttonBaixo.dart';
import 'package:celer_pesquisa_app/funcionalidades/question_model.dart';
import 'package:celer_pesquisa_app/utilidades/alert.dart';

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
  Map<String, String> individualQuiz = {};
  var userChoice;
  var questionText;
  List<dynamic> choicesText;
  int questionNumber = 0;
  String image;
  String buttonText;

  @override
  void initState() {
    super.initState();
    //print(widget.questionsData);
    updateUI(widget.questionsData);
    print(fieldType());
  }

  void updateUI(dynamic questionDataApi) {
    questionText = questionDataApi[questionNumber]['name'];
    choicesText = widget.questionsData[questionNumber]['choices'];
    image = questionDataApi[questionNumber]['image'];
    checkLastQuestion();
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

  bool isLastQuestion() {
    if (questionNumber == questionBankLength() - 1) {
      return true;
    } else {
      return false;
    }
  }

  void checkLastQuestion() {
    if (isLastQuestion() == true) {
      buttonText = 'TERMINAR';
    } else {
      buttonText = 'PRÓXIMA';
    }
  }

  bool isFinished() {
    if (questionNumber >= questionBankLength() - 1) {
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void checkEndOdQuiz() {
    setState(() {
      if (isFinished() == true) {
        alert(context, IniciarQuiz.id, 'O resultado está salvo em seu celular.',
            'Você terminou!');
        print(individualQuiz); // I HAVE TO SEND THIS FILE TO THE LOCAL MEMORY
      } else {
        nextQuestion();
      }
    });
  }

  List<String> fieldType() {
    final allTypes = List<String>();
    for (Map map in widget.questionsData) {
      QuestionModel c = QuestionModel.fromJson(map);
      allTypes.add(c.fieldType);
    }
    return allTypes;
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
    var choices = []; //
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
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Image(
                  image: NetworkImage(image),
                ),
              ),
            ),
          ),
          ...getChoices(),
          ButtonBaixo(
            buttonTitle: buttonText,
            onTap: () {
              individualQuiz[questionText] = userChoice;
              print(userChoice);
              print(questionText);
              checkEndOdQuiz();
            },
          )
        ],
      ),
    );
  }
}

/* TextFormField for input


 TextFormField(
          style: kTextCorEscuro,
          decoration: InputDecoration(
              labelText: 'teste',
              labelStyle: TextStyle(
                color: kButtonCor2,
              ),
              hintText: 'teste',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kButtonCor1, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kButtonCor1, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              )),
        );
 */
