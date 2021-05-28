import 'package:flutter/material.dart';
import 'package:learning_appfinal/models/options_model.dart';

class OptionsProvider extends ChangeNotifier {
  List<Option> options = [];

  cargarOpcionesPregunta(int idPregunta) async {
    final option = await OptionModel().getOptionQuestionById(idPregunta);
    this.options = [...option];
    notifyListeners();
  }
}
