import 'package:celer_pesquisa_app/funcionalidades/estrutura_das_questoes.dart';

class QuestaoCerebro {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans',
        a: ['sim', 'nao', 'talvez']),
    Question('You can lead a cow down stairs but not up stairs.',
        a: ['sim', 'nao', 'aaaaaa']),
    Question('Questao sem alternativa'),
    Question('Approximately one quarter of human bones are in the feet.',
        a: ['sim', 'ssssssss', 'talvez', 'uuu']),
    Question('TEssssssssss', a: [
      'foi',
      'ssssssss',
    ]),
    Question('AAAAAAAAAA', a: ['sim', 'ssssssss', 'talvez', 'uuu', 'yyyyy']),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  List<String> getAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  //TODO: Step 3 Part A - Create a method called isFinished() here that checks to see if we have reached the last question. It should return (have an output) true if we've reached the last question and it should return false if we're not there yet.

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      //TODO: Step 3 Part B - Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.

      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  //TODO: Step 4 part B - Create a reset() method here that sets the questionNumber back to 0.
  void reset() {
    _questionNumber = 0;
  }

  bool choicesButtonVisibility() {
    if (_questionBank[_questionNumber].questionAnswer.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}

// Loop para imprimir as opcoes
// List<String> imprimindoOpcoes(List<String> qtdChoices) {
//   List<String> cadaAlternativa = [];
//   for (int i = 0; i < qtdChoices.length; i++) {
//     String alternativa = qtdChoices[i];
//     cadaAlternativa.add(alternativa);
//   }
//   return cadaAlternativa;
// }
