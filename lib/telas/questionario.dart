import 'package:celer_pesquisa_app/funcionalidades/db_helper.dart';
import 'package:celer_pesquisa_app/telas/iniciar_quiz_tela.dart';
import 'package:flutter/material.dart';
import 'package:celer_pesquisa_app/constantes.dart';
import 'package:celer_pesquisa_app/utilidades/buttonBaixo.dart';
import 'package:celer_pesquisa_app/funcionalidades/question_model.dart';
import 'package:celer_pesquisa_app/utilidades/alert.dart';
import 'package:celer_pesquisa_app/funcionalidades/quiz_local_db_model.dart';

class QuestionarioQuiz extends StatefulWidget {
  static const String id = 'identificacao_quiz';
  QuestionarioQuiz({this.questionsData});
  final questionsData;

  @override
  _QuestionarioQuizState createState() => _QuestionarioQuizState();
}

class _QuestionarioQuizState extends State<QuestionarioQuiz> {
  // Um quiz individual será armazenado aqui
  List<String> individualQuiz = [];
  var userChoice;
  var userInputAnswer;
  var questionText;
  List<dynamic> choicesText;
  int questionNumber = 0;
  String image;
  String buttonText;
  String stringQuizList;
  final myController = TextEditingController();
  DatabaseHelper databaseHelper = DatabaseHelper();
  Color teste = Colors.red;
  int _selectedIndex;
  bool _validate = false;

  @override
  void initState() {
    super.initState();
    //print(widget.questionsData);
    updateUI(widget.questionsData);
    //print(fieldType());
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

  void checkingEachQuestion() {
    setState(() {
      userInputAnswer = myController.text;
      if (userChoice == null) {
        if (myController.text.isEmpty) {
          _validate = true;
        } else {
          _validate = false;
          individualQuiz.add('$questionText $userInputAnswer');
          print(userInputAnswer);
          myController.clear();
          FocusScope.of(context).unfocus();
          checkEndOdQuiz();
        }
      } else {
        if (userChoice == '') {
          _validate = true;
        } else {
          _validate = false;
          individualQuiz.add('$questionText $userChoice');
          print(userChoice);
          userChoice = null;
          _selectedIndex = -1;
          checkEndOdQuiz();
        }
      }
    });
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
      buttonText = 'TERMINAR E SALVAR';
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

  void stringList() {
    stringQuizList = individualQuiz.join('||');
  }

  void checkEndOdQuiz() {
    if (isFinished() == true) {
      //Stringify List of quiz to save in Sqflite
      stringList();
      _saveQuiz();
      numberOfQuiz();
      alert(context, IniciarQuiz.id, 'O resultado está salvo em seu celular.',
          'Você terminou!');
      print(stringQuizList); // I HAVE TO SEND THIS FILE TO THE LOCAL MEMORY
      //print(databaseHelper.getCount());
    } else {
      nextQuestion();
    }
  }

  // List<String> fieldType() {
  //   final allTypes = List<String>();
  //   for (Map map in widget.questionsData) {
  //     QuestionModel c = QuestionModel.fromJson(map);
  //     allTypes.add(c.fieldType);
  //   }
  //   return allTypes;
  // }

// Print todos os field placeHolder
  // List<String> listFieldPlaceholder() {
  //   final allChoices = List<String>();
  //   for (Map map in widget.questionsData) {
  //     QuestionModel c = QuestionModel.fromJson(map);
  //     allChoices.add(c.fieldPlaceholder);
  //   }
  //   return allChoices;
  // }

  List<dynamic> choicesList() {
    var choices = []; //
    for (int i = 0; i < choicesText.length; i++) {
      var eachChoice = choicesText[i]['name'];
      choices.add(eachChoice);
    }
    return choices;
  }

  getChoices() {
    var listChoices = choicesList();
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: listChoices.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          tileColor: Colors.red,
          title: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                listChoices[index],
                style: kTextOptions,
              ),
            ),
          ),
          selected: index == _selectedIndex,
          selectedTileColor: Colors.red[200],
          onTap: () {
            setState(() {
              _selectedIndex = index;
              userChoice = listChoices[index];
            });
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  Expanded textField() {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: TextField(
          controller: myController,
          style: kTextCorEscuro,
          decoration: InputDecoration(
              labelText: 'Sua resposta aqui...',
              errorText:
                  _validate ? 'Digite a sua resposta antes de avançar.' : null,
              labelStyle: TextStyle(
                color: kButtonCor2,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kButtonCor1, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kButtonCor1, width: 2.0),
              )),
        ),
      ),
    );
  }

  bool displayField() {
    if (widget.questionsData[questionNumber]['fieldType'] == 'choice') {
      return false;
    } else {
      return true;
    }
  }

  void _saveQuiz() async {
    int result;
    result = await databaseHelper.insertQuiz(QuizDBModel(stringQuizList));

    if (result != 0) {
      //Success
      print('Quiz saved!');
    } else {
      //Failure
      print('Error, quiz hasnt been saved!');
    }
  }

  void numberOfQuiz() async {
    int result = await databaseHelper.getCount();
    print('Number of quiz saved: $result');
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
        // leading: FlatButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   child: Icon(
        //     Icons.arrow_back_ios,
        //     size: 50.0,
        //     color: kButtonCor2,
        //   ),
        // ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Visibility(
            visible: _validate,
            child: Center(
              child: Container(
                margin: EdgeInsetsDirectional.only(top: 5.0),
                child: Text(
                  'Pergunta sem resposta!',
                  style: kWarningmsg,
                ),
              ),
            ),
          ),
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
          Visibility(
            visible: displayField(),
            child: textField(),
          ),
          getChoices(),
          ButtonBaixo(
            buttonTitle: buttonText,
            onTap: () {
              // userInputAnswer = myController.text;
              // if (userChoice == null) {
              //   individualQuiz.add('$questionText $userInputAnswer');
              //   print(userInputAnswer);
              // } else {
              //   individualQuiz.add('$questionText $userChoice');
              //   print(userChoice);
              // }
              // myController.clear();
              // userChoice = null;
              // _selectedIndex = -1;
              // FocusScope.of(context).unfocus();
              checkingEachQuestion();
              print(questionText);
              //checkEndOdQuiz();
            },
          )
        ],
      ),
    );
  }
}
