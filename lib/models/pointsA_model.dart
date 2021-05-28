//import 'package:flutter_riverpod/flutter_riverpod.dart';
/* import 'package:learning_appfinal/providers/options_provider.dart';
import 'package:learning_appfinal/providers/topics_provider.dart'; */
import 'package:learning_appfinal/conexion/db_helper.dart';
import 'package:sqflite/sqflite.dart';

final tablePointsA = 'tbl_puntosA';
final columnnPointsAId = 'puntosA_id';
final columnPointsAIdTo = 'tema_id';
final columnPointsAScore = 'puntosA_score';
final columnPointsANumQuesC = 'puntosA_numQuesC';
final columnPointsANumQuesIn = 'puntosA_numQuesIn';
final columnPointsANumQuesUn = 'puntosA_numQuesUn';
final columnPointsAPorcenTo = 'puntosA_porcentajeTema';
final columnPointsAPorcenDe = 'puntosA_porcentajeDesem';
final columnPointsAState = 'puntosA_estado';

class PointsA {
  int id, idTo, scoreT, numQuesC, numQuesIn, numQuesUn, statePA;
  num porcentajeTo, porcentajeDe;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnnPointsAId: id,
      columnPointsAIdTo: idTo,
      columnPointsAScore: scoreT,
      columnPointsANumQuesC: numQuesC,
      columnPointsANumQuesIn: numQuesIn,
      columnPointsANumQuesUn: numQuesUn,
      columnPointsAPorcenTo: porcentajeTo,
      columnPointsAPorcenDe: porcentajeDe,
      columnPointsAState: statePA
    };
    return map;
  }

  PointsA();
  PointsA.fromMap(Map<String, dynamic> map) {
    id = map[columnnPointsAId];
    idTo = map[columnPointsAIdTo];
    scoreT = map[columnPointsAScore];
    numQuesC = map[columnPointsANumQuesC];
    numQuesIn = map[columnPointsANumQuesIn];
    numQuesUn = map[columnPointsANumQuesUn];
    porcentajeTo = map[columnPointsAPorcenTo];
    porcentajeDe = map[columnPointsAPorcenDe];
    statePA = map[columnPointsAState];
  }
}

class PointsAModel {
  Future<List<PointsA>> getPointsAById(int id) async {
    Database db = await copyDB();
    var maps = await db.query(
      tablePointsA,
      columns: [
        columnnPointsAId,
        columnPointsAIdTo,
        columnPointsAScore,
        columnPointsANumQuesC,
        columnPointsANumQuesIn,
        columnPointsANumQuesUn,
        columnPointsAPorcenTo,
        columnPointsAPorcenDe,
        columnPointsAState,
      ],
      where: '$columnPointsAIdTo=?',
      whereArgs: [id],
    );
    if (maps.length > 0) return maps.map((pointsA) => PointsA.fromMap(pointsA)).toList();

    return null;
  }

  Future<int> update(Database db, PointsA pointsA) async {
    return await db.update(tablePointsA, pointsA.toMap(),
        where: '$columnPointsAIdTo = ?', whereArgs: [pointsA.idTo]);
  }
}
