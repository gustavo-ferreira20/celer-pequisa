int _questaoNum = 0;

const List<String> perguntas = [
  'Nome',
  'Sobrenome',
  'Instituição',
];

String pegarQuestaoTexto() {
  return perguntas[_questaoNum];
}

const List<String> respostas = ['resposta 1', 'resposta 2', 'resposta 3'];
