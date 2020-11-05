// To parse this JSON data, do
//
//     final questionsFromApi = questionsFromApiFromJson(jsonString);

import 'dart:convert';

class QuestionModel {
  QuestionModel({
    this.id,
    this.name,
    this.fieldType,
    this.index,
    this.choices,
    this.responsesNumber,
    this.fieldWidget,
    this.image,
    this.fieldPlaceholder,
  });

  int id;
  String name;
  String fieldType;
  int index;
  List<Choice> choices;
  int responsesNumber;
  String fieldWidget;
  String image;
  String fieldPlaceholder;

  factory QuestionModel.fromRawJson(String str) =>
      QuestionModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        id: json["id"],
        name: json["name"],
        fieldType: json["fieldType"],
        index: json["index"],
        choices:
            List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
        responsesNumber: json["responsesNumber"],
        fieldWidget: json["fieldWidget"],
        image: json["image"],
        fieldPlaceholder:
            json["fieldPlaceholder"] == null ? null : json["fieldPlaceholder"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "fieldType": fieldType,
        "index": index,
        "choices": List<dynamic>.from(choices.map((x) => x.toJson())),
        "responsesNumber": responsesNumber,
        "fieldWidget": fieldWidget,
        "image": image,
        "fieldPlaceholder": fieldPlaceholder == null ? null : fieldPlaceholder,
      };
}

class Choice {
  Choice({
    this.id,
    this.choices,
  });

  int id;
  String choices;

  factory Choice.fromRawJson(String str) => Choice.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        id: json["id"],
        choices: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": choices,
      };
}
