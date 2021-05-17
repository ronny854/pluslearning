//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';

final tableOption = 'tbl_opcion';
final columnOptionId = 'opcion_id';
final columnOptionIdQue = 'pregunta_id';
final columnOptionText = 'opcion_texto';
final columnOptionCorrect = 'opcion_correcta';
final columnOptionState = 'opcion_estado';

class Option {
  int id, idQue, correctO, stateO;
  String textO;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnOptionId: id,
      columnOptionIdQue: idQue,
      columnOptionText: textO,
      columnOptionCorrect: correctO,
      columnOptionState: stateO,
    };
    return map;
  }

  Option();

  Option.fromMap(Map<String, dynamic> map) {
    id = map[columnOptionId];
    idQue = map[columnOptionIdQue];
    textO = map[columnOptionText];
    correctO = map[columnOptionCorrect];
    stateO = map[columnOptionState];
  }
}

class OptionProvider {
  Future<List<Option>> getOptionQuestionById(Database db, int id) async {
    var maps = await db.query(
      tableOption,
      columns: [
        columnOptionId,
        columnOptionIdQue,
        columnOptionText,
        columnOptionCorrect,
        columnOptionState,
      ],
      where: '$columnOptionIdQue=?',
      whereArgs: [id],
      orderBy: 'Random()',
    );
    if (maps.length > 0) return maps.map((option) => Option.fromMap(option)).toList();
    return null;
  }
}

/* class OptionList extends StateNotifier<List<Option>> {
  OptionList(List<Option> state) : super(state ?? []);
  void addAll(List<Option> option) {
    state.addAll(option);
  }

  void add(Option option) {
    state = [
      ...state,
      option,
    ];
  }
} */
