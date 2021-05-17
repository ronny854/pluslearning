import 'package:flutter/material.dart';
import 'package:learning_appfinal/conexion/db_helper.dart';
import 'package:learning_appfinal/providers/questions_provider.dart';
import 'package:learning_appfinal/views/game.dart';

class ePreguntas extends StatelessWidget {
  ePreguntas({Key key, this.idTemaPregunta}) : super(key: key);
  int idTemaPregunta;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Question>>(
      future: getQuestionByCategory(idTemaPregunta),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        } else {
          return Game(
            listQuestions: snapshot.data,
          );
        }
      },
    );
  }

  Future<List<Question>> getQuestionByCategory(int id) async {
    var db = await copyDB();
    var result = await QuestionProvider().getQuestionCategoryById(db, id);

    return result;
  }
}
