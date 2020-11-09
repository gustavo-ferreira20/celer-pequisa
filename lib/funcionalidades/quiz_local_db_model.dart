class QuizDBModel {
  int _id;
  String _quiz;

  QuizDBModel(this._quiz);

  QuizDBModel.withId(this._id, this._quiz);

  int get id => _id;
  String get question => _quiz;

  set question(String newQuiz) {
    this._quiz = newQuiz;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['quiz'] = _quiz;
    return map;
  }

  QuizDBModel.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._quiz = map['quiz'];
  }
}
