import 'package:flutter/material.dart';
import 'package:learning_appfinal/models/questions_model.dart';

class QuestionsProvider extends ChangeNotifier {
  List<Question> questions = [];

  cargarPreguntasTema(int idTema) async {
    final question = await QuestionModel().getQuestionCategoryById(idTema);
    this.questions = [...question];
    notifyListeners();
  }
}
