import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learning_appfinal/models/questions_model.dart';
import 'package:learning_appfinal/others/constans.dart';
import 'package:learning_appfinal/others/preferences.dart';
import 'package:learning_appfinal/views/game.dart';

class ePreguntas extends StatelessWidget {
  ePreguntas({Key key, this.idTemaPregunta, this.score}) : super(key: key);
  int idTemaPregunta;
  int score;
  int limitTime;
  int dificultad;
  double damageHero;
  double damageEnemy;
  final prefs = new Preferences();
  var escenarioJ = [Escenario1, Escenario2, Escenario3, Escenario4, Escenario5];
  var enemigoList = [Enemigo_1, Enemigo_2, Enemigo_3, Enemigo_4];
  var iconEnemyList = [IconE1, IconE2, IconE3, IconE4];

  @override
  Widget build(BuildContext context) {
/*     final questionsProvider = Provider.of<QuestionsProvider>(context, listen: false);
    questionsProvider.cargarPreguntasTema(idTemaPregunta);
    final questions = questionsProvider.questions;
    return Game(
      listQuestions: questions,
    ); */
    int _enemyR = numRamdom(4);
    int _escenarioSelect = numRamdom(5);
    print('$_enemyR  and $_escenarioSelect');

    if (score >= 0 && score <= 200) {
      limitTime = 60;
      dificultad = 1;
      damageEnemy = 0.2;
      damageHero = 0.2;
    } else if (score >= 201 && score <= 500) {
      limitTime = 30;
      dificultad = 2;
      damageEnemy = 0.25;
      damageHero = 0.125;
    } else if (score >= 501 && score <= 800) {
      limitTime = 20;
      dificultad = 3;
      damageEnemy = 0.34;
      damageHero = 0.1;
    } else if (score >= 801) {
      limitTime = 20;
      dificultad = 4;
      damageEnemy = 0.34;
      damageHero = 0.1;
    }

    return FutureBuilder<List<Question>>(
      future: idTemaPregunta == 1 && prefs.calibrateGrammar == false
          ? getQuestionByCalibrate(idTemaPregunta)
          : idTemaPregunta == 2 && prefs.calibrateReading == false
              ? getQuestionByCalibrate(idTemaPregunta)
              : idTemaPregunta == 3 && prefs.calibrateListening == false
                  ? getQuestionByCalibrate(idTemaPregunta)
                  : idTemaPregunta == 4 && prefs.calibrateVocabulary == false
                      ? getQuestionByCalibrate(idTemaPregunta)
                      : dificultad == 4
                          ? getQuestionByCategory(idTemaPregunta)
                          : getQuestionByDificulty(idTemaPregunta, dificultad),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        } else {
          return Game(
            listQuestions: snapshot.data,
            score: score,
            limitTime: limitTime,
            dificultad: dificultad,
            damageHero: damageHero,
            damageEnemy: damageEnemy,
            idTema: idTemaPregunta,
            escenarioS: escenarioJ[_escenarioSelect],
            enemySelct: enemigoList[_enemyR],
            iconEnemy: iconEnemyList[_enemyR],
          );
        }
      },
    );
  }

  int numRamdom(int max) {
    var random = Random();
    return (random.nextInt(max));
  }

  Future<List<Question>> getQuestionByCategory(int idTemaPregunta) async {
    var result = await QuestionModel().getQuestionCategoryById(idTemaPregunta);

    return result;
  }

  Future<List<Question>> getQuestionByDificulty(int idTemaPregunta, int dificulty) async {
    var result = await QuestionModel().getQuestionByDificulty(idTemaPregunta, dificulty);

    return result;
  }

  Future<List<Question>> getQuestionByCalibrate(int idTemaPregunta) async {
    var result = await QuestionModel().getQuestionByCalibrate(idTemaPregunta);

    return result;
  }
}
