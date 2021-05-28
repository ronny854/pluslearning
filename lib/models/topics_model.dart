//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_appfinal/conexion/db_helper.dart';
import 'package:sqflite/sqflite.dart';

final tableTopics = 'tbl_tema';
final columnTopicId = 'tema_id';
final columnTopicName = 'tema_nombre';
final columnPointsAScore = 'puntosA_score';
final columnTopicState = 'tema_estado';

class Topic {
  int id;
  String name;
  int stateT, scoreT;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnTopicId: id,
      columnTopicName: name,
      columnTopicState: stateT,
      columnPointsAScore: scoreT
    };
    return map;
  }

  Topic();
  Topic.fromMap(Map<String, dynamic> map) {
    id = map[columnTopicId];
    name = map[columnTopicName];
    stateT = map[columnTopicState];
    scoreT = map[columnPointsAScore];
  }
}

class TopicModel {
  Future<List<Topic>> getTopics() async {
    Database db = await copyDB();
    var maps = await db.query(tableTopics,
        columns: [columnTopicId, columnTopicName, columnTopicState],
        where: '$columnTopicState=?',
        whereArgs: [1]);
    if (maps.length > 0) {
      return maps.map((topic) => Topic.fromMap(topic)).toList();
    }
    return null;
  }

  Future<List<Topic>> getTopics2() async {
    Database db = await copyDB();
    var maps = await db.rawQuery('''
    SELECT * FROM tbl_tema, tbl_puntosA WHERE tbl_tema.tema_id = tbl_puntosA.tema_id
    ''');
    if (maps.length > 0) {
      return maps.map((topic) => Topic.fromMap(topic)).toList();
    }
    return null;
  }
}

/* class TopicList extends StateNotifier<List<Topic>> {
  TopicList(List<Topic> state) : super(state ?? []);
  void addAll(List<Topic> topic) {
    state.addAll(topic);
  }

  void add(Topic topic) {
    state = [
      ...state,
      topic,
    ];
  }
} */
