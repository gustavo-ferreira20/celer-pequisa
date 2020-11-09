import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:celer_pesquisa_app/funcionalidades/quiz_local_db_model.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String quizTable = 'quiz_table';
  String colId = 'id';
  String colQuiz = 'quiz';

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initialiazeDatabase();
    }

    return _database;
  }

  Future<Database> initialiazeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'quiz.db';

    var quizDB = await openDatabase(path, version: 1, onCreate: _createDb);
    return quizDB;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $quizTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colQuiz TEXT)');
  }

  //Fetch all quiz from DB

  Future<List<Map<String, dynamic>>> getQuizMapList() async {
    Database db = await this.database;

    var result = await db.query(quizTable, orderBy: '$colId ASC');
    return result;
  }

  // Insert a quiz obj to DB
  Future<int> insertQuiz(QuizDBModel quizDBModel) async {
    Database db = await this.database;
    var result = await db.insert(quizTable, quizDBModel.toMap());
    return result;
  }

  // Update a quiz obj from dB
  Future<int> updateQuiz(QuizDBModel quizDBModel) async {
    var db = await this.database;
    var result = await db.update(quizTable, quizDBModel.toMap(),
        where: '$colId = ?', whereArgs: [quizDBModel.id]);
    return result;
  }

  //Delete a Quiz obj from Db

  Future<int> deleteQuiz(int id) async {
    var db = await this.database;
    var result =
        await db.rawDelete('DELETE FROM $quizTable WHERE $colId = $id');
  }

  // Number of quiz obj in the DB

  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $quizTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }
}
