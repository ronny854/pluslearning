import 'package:flutter/material.dart';
import 'package:learning_appfinal/models/pointsA_model.dart';

class PointsProvider extends ChangeNotifier {
  //List<Option> options = [];

  updatePoints(int score, int idT) async {
    final points = await PointsAModel().updateP(score, idT);
    print(points);
    //this.options = [...option];
    notifyListeners();
  }
}
