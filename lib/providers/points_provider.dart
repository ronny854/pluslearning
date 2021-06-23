import 'package:flutter/material.dart';
import 'package:learning_appfinal/models/pointsA_model.dart';

class PointsProvider extends ChangeNotifier {
  List<PointsA> pointsA = [];

  cargarPuntos(int idTema) async {
    final point = await PointsAModel().getPointsAById(idTema);
    this.pointsA = [...point];
    notifyListeners();
  }

  updatePoints(int score, int idT, int tcorrectQ, int tincorrectQ, num desem) async {
    final points = await PointsAModel().updateP(score, idT, tcorrectQ, tincorrectQ, desem);
    print(points);
    //this.options = [...option];
    notifyListeners();
  }
}
