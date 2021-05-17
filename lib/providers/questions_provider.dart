//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';

final tableQuestion = 'tbl_pregunta';
final columnQuestionId = 'pregunta_id';
final columnQuestionIdTopic = 'tema_id';
final columnQuestionText = 'pregunta_texto';
final columnQuestionType = 'pregunta_tipo';
final columnQuestionImg = 'pregunta_img';
final columnQuestionSnd = 'pregunta_snd';
final columnQuestionDifficulty = 'pregunta_dificultad';
final columnQuestionScore = 'pregunta_score';
final columnQuestionState = 'pregunta_estado';

class Question {
  int id, score, stateQ, difficulty, idTo;
  String textQ, typeQ, imgQ, sndQ;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnQuestionId: id,
      columnQuestionIdTopic: idTo,
      columnQuestionText: textQ,
      columnQuestionType: typeQ,
      columnQuestionImg: imgQ,
      columnQuestionSnd: sndQ,
      columnQuestionDifficulty: difficulty,
      columnQuestionScore: score,
      columnQuestionState: stateQ
    };
    return map;
  }

  Question();
  Question.fromMap(Map<String, dynamic> map) {
    id = map[columnQuestionId];
    idTo = map[columnQuestionIdTopic];
    textQ = map[columnQuestionText];
    typeQ = map[columnQuestionType];
    imgQ = map[columnQuestionImg];
    sndQ = map[columnQuestionSnd];
    difficulty = map[columnQuestionDifficulty];
    score = map[columnQuestionScore];
    stateQ = map[columnQuestionState];
  }
}

class QuestionProvider {
  Future<List<Question>> getQuestionCategoryById(Database db, int id) async {
    var maps = await db.query(tableQuestion,
        columns: [
          columnQuestionId,
          columnQuestionIdTopic,
          columnQuestionText,
          columnQuestionType,
          columnQuestionImg,
          columnQuestionSnd,
          columnQuestionDifficulty,
          columnQuestionScore,
          columnQuestionState,
        ],
        where: '$columnQuestionIdTopic=? and $columnQuestionState=?',
        whereArgs: [id, 1],
        limit: 10,
        orderBy: 'Random()');
    if (maps.length > 0) return maps.map((question) => Question.fromMap(question)).toList();
    return null;
  }
}

/* class QuestionList extends StateNotifier<List<Question>> {
  QuestionList(List<Question> state) : super(state ?? []);
  void addAll(List<Question> question) {
    state.addAll(question);
  }

  void add(Question question) {
    state = [
      ...state,
      question,
    ];
  }
} */
