import 'dart:async';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:learning_appfinal/conexion/db_helper.dart';
import 'package:learning_appfinal/others/constans.dart';
import 'package:learning_appfinal/models/options_model.dart';
import 'package:learning_appfinal/models/questions_model.dart';
import 'package:learning_appfinal/others/preferences.dart';
//import 'package:learning_appfinal/providers/options_provider.dart';
import 'package:learning_appfinal/providers/points_provider.dart';
import 'package:learning_appfinal/views/score.dart';
import 'package:learning_appfinal/widgets/count_down.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

/* class Game extends StatefulWidget {
  final List mydata;
  Game({Key key, @required this.mydata}) : super(key: key);

  @override
  _GameState createState() => _GameState(mydata);
} */
// ignore: must_be_immutable
class Game extends StatefulWidget {
  final List<Question> listQuestions;
  int score;
  int limitTime;
  int dificultad;
  double damageHero;
  double damageEnemy;
  int idTema;
  String escenarioS;
  String enemySelct;
  String iconEnemy;
  Game(
      {Key key,
      this.listQuestions,
      this.score,
      this.limitTime,
      this.dificultad,
      this.damageHero,
      this.damageEnemy,
      this.idTema,
      this.escenarioS,
      this.enemySelct,
      this.iconEnemy})
      : super(key: key);

  @override
  _GameState createState() => _GameState(
        listQuestions,
        score,
        limitTime,
        dificultad,
        damageHero,
        damageEnemy,
        idTema,
        escenarioS,
        enemySelct,
        iconEnemy,
      );
}

class _GameState extends State<Game> with TickerProviderStateMixin {
  //controler timer
  AnimationController _controllerTimer;

  final prefs = new Preferences();
  final int score;
  final int limitTime;
  final int dificultad;
  final double damageHero;
  final double damageEnemy;
  final int idTema;
  final String escenarioS;
  final String enemySelct;
  final String iconEnemy;

  final List<Question> listQuestions;
  _GameState(
    this.listQuestions,
    this.score,
    this.limitTime,
    this.dificultad,
    this.damageHero,
    this.damageEnemy,
    this.idTema,
    this.escenarioS,
    this.enemySelct,
    this.iconEnemy,
  );
  int numQuestion = 0;

  ////////////////////////////////////////////////////////////////////////
  //String animacion = Espera;
  String _animacionHero = "espera";
  String _animacionEnemy = "espera";
  final FlareControls _controlsPersonje = FlareControls();
  final FlareControls _controlsEnemigo = FlareControls();

  Color colortoshow = Colors.indigo;
  Color right = Colors.green; //verde
  Color wrong = Colors.red; // rojo
  Color defaul = Colors.indigo[400];
  int points = 0;

  int questionsCorrect = 0;
  int questionsIncorrect = 0;

  int i = 1;
  bool disableAnswer = false;
  bool _winner = false;
  // extra varibale to iterate
  int j = 1;
/*   int timer = 60;
  String showtimer = "60"; */
  //var random_array;

  Map<int, Color> btncolor = {
    0: Colors.indigo[400],
    1: Colors.indigo[400],
    2: Colors.indigo[400],
    3: Colors.indigo[400],
    4: Colors.indigo[400],
    5: Colors.indigo[400],
    6: Colors.indigo[400],
    7: Colors.indigo[400],
  };

  bool canceltimer = false;
  bool questionState = false;
  bool _optionState = true;
  bool _isButtonDisabled;
  double lifeHero = 1.0;
  double lifeEnemy = 1.0;
  AsyncSnapshot _snapshotOp;
  Color barHero = Colors.green;
  Color barEnemy = Colors.green;
  //int dificultad = 1;
  //double damageHero = 0.2;
  //double damageEnemy = 0.2;
  double _withImg;
  double _heighImg;
  bool _dobleTapImg = false;

  ////audio player
  bool _play = false;
  AnimationController audioAnimation;
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void dispose() {
    this.assetsAudioPlayer.dispose();
    if (_controllerTimer.isAnimating || _controllerTimer.isCompleted) {
      this._controllerTimer.dispose();
      super.dispose();
    }
  }

  @override
  void initState() {
    _isButtonDisabled = false;

    super.initState();

    _controllerTimer = AnimationController(vsync: this, duration: Duration(seconds: limitTime));
    _controllerTimer.addListener(() {
      if (_controllerTimer.isCompleted) {
        if (this.mounted) {
          setState(() {
            _controllerTimer.stop();
            _animacionEnemy = "ataque";
            _animacionHero = "damage";
            _controlsEnemigo.play(_animacionEnemy);
            _controlsPersonje.play(_animacionHero);
            _controlsEnemigo.onCompleted(_animacionEnemy = "espera");
            _controlsPersonje.onCompleted(_animacionHero = "espera");
            lifeHero = double.parse((lifeHero - damageEnemy).toStringAsFixed(1));
            questionsIncorrect += 1;
            if (lifeHero >= 0.1) {
              //print('vida: $lifeHero daño: $damageEnemy');
              if (lifeHero <= 0.6 && lifeHero >= 0.4) barHero = Colors.yellow; //amarillo
              if (lifeHero <= 0.4 && lifeHero >= 0.0) barHero = Colors.red;
            } else {
              lifeHero = 0.0;
              _winner = false;
              enviarScore();
            }
            Timer(Duration(milliseconds: 4000), nextquestion);
            //_controllerTimer.reset();
            //_controllerTimer.forward();
          });
        }
      }
    });
    _controllerTimer.forward(); //Start timer
  }

  void checkanswer(int correctO, int posColor) {
    _optionState = false;
    if (this.mounted) {
      setState(() {
        _play = false;
        //assetsAudioPlayer.stop();
        _isButtonDisabled = true;
        _controllerTimer.stop();
        // _controllerTimer.reset();

        if (correctO == 1) {
          points = points + listQuestions[numQuestion].score;
          questionsCorrect += 1;
          colortoshow = right;

          _animacionHero = "ataque";
          _animacionEnemy = "damage";
          _controlsPersonje.play(_animacionHero);
          _controlsEnemigo.play(_animacionEnemy);
          _controlsPersonje.onCompleted(_animacionHero = "espera");
          _controlsEnemigo.onCompleted(_animacionEnemy = "espera");
          lifeEnemy = double.parse((lifeEnemy - damageHero).toStringAsFixed(1));
          if (lifeEnemy >= 0.1) {
            if (lifeEnemy <= 0.6 && lifeEnemy >= 0.4) barEnemy = Colors.yellow;
            if (lifeEnemy <= 0.4 && lifeEnemy >= 0.0) barEnemy = Colors.red;
          } else {
            lifeEnemy = 0.0;
            _controlsEnemigo.play("death");
            _winner = true;

            //_controlsEnemigo.onCompleted(name)
            enviarScore();
          }
        } else {
          colortoshow = wrong;
          questionsIncorrect += 1;
          _animacionEnemy = "ataque";
          _animacionHero = "damage";
          _controlsEnemigo.play(_animacionEnemy);
          _controlsPersonje.play(_animacionHero);
          _controlsEnemigo.onCompleted(_animacionEnemy = "espera");
          _controlsPersonje.onCompleted(_animacionHero = "espera");
          lifeHero = double.parse((lifeHero - damageEnemy).toStringAsFixed(1));
          if (lifeHero >= 0.1) {
            //print('vida: $lifeHero daño: $damageEnemy');
            if (lifeHero <= 0.6 && lifeHero >= 0.4) barHero = Colors.yellow;
            if (lifeHero <= 0.4 && lifeHero >= 0.0) barHero = Colors.red;
          } else {
            lifeHero = 0.0;
            _controlsPersonje.play("death");
            _winner = false;
            enviarScore();
          }
        }
        // applying the changed color to the particular button that was selected
        //setState(() {
        btncolor[posColor] = colortoshow;
        //colorboton[posColor] = colortoshow;
        disableAnswer = true;
        Timer(Duration(milliseconds: 4000), nextquestion);

        // nextquestion();
        //});

        //_controllerTimer.dispose();
      });
    }
  }

  void nextquestion() {
    // print(idTema);
    //canceltimer = false;
    //timer = 30;
    //questionState = false;
    numQuestion++;
    _isButtonDisabled = false;
    _optionState = true;
/*     if (numQuestion < listQuestions.length - 1) {
      numQuestion++;
    } */
    /* else {
      enviarScore();
    } */
    if (this.mounted) {
      setState(() {
        for (var i = 0; i < btncolor.length; i++) {
          btncolor[i] = defaul;
        }
      });
    }
/*       for (var i = 0; i < btncolor.length; i++) {
        btncolor[i] = defaul;
      } */

    _controllerTimer.reset();
    _controllerTimer.forward();
    audioAnimation.reverse();

    _play = false;

    //starttimer();
  }

  Future<dynamic> enviarScore() {
    int res = 0;
    //_controllerTimer.dispose();
    return Future.delayed(Duration(seconds: 2), () {
      //_controllerTimer.stop();
      //PointsAModel().updateP(res, idTema);
      //print(topic.id);

      final _pointsProvider = Provider.of<PointsProvider>(context, listen: false);
      //_pointsProvider.cargarPuntos(idTema);
      final _pointsA = _pointsProvider.pointsA;
      int tcorrectQ = _pointsA[0].numQuesC + questionsCorrect;
      int tincorrectQ = _pointsA[0].numQuesIn + questionsIncorrect;
      num desem = formatNumero((tcorrectQ) / (tcorrectQ + tincorrectQ));
      res = _pointsA[0].scoreT + points;
      print('desempenio = $desem');
      //print('correct= $questionsCorrect incorrect=$questionsIncorrect');
      //print(_pointsA[0].numQuesC);
      _pointsProvider.updatePoints(res, idTema, tcorrectQ, tincorrectQ, desem);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Score(
          points: points,
          winner: _winner,
        );
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final _pointsProvider = Provider.of<PointsProvider>(context, listen: false);
    _pointsProvider.cargarPuntos(idTema);

    return Scaffold(
      body: Container(
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            Container(
              child: Image.asset(
                escenarioS,
                fit: BoxFit.cover,
                height: media.height,
                width: media.width,
              ),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    '${prefs.iconPersonajeS}',
                    fit: BoxFit.cover,
                    height: 55.0,
                    width: 55.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 160.0),
                  ),
                  Transform(
                    transform: Matrix4.diagonal3Values(-1.0, 1.0, 1.0),
                    child: LinearPercentIndicator(
                      width: 160.0,
                      lineHeight: 22.0,
                      percent: 1 - lifeHero,
                      backgroundColor: barHero,
                      progressColor: Colors.grey,
                      animation: true,
                      animationDuration: 1000,
                      curve: Curves.fastOutSlowIn,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 93.0),
                  ),
                  LinearPercentIndicator(
                    width: 160.0,
                    lineHeight: 22.0,
                    percent: 1 - lifeEnemy,
                    //linearStrokeCap: LinearStrokeCap.roundAll,
                    backgroundColor: barEnemy,
                    progressColor: Colors.grey,
                    animation: true,
                    animationDuration: 1000,
                    curve: Curves.fastOutSlowIn,
                  ),
                  Image.asset(
                    iconEnemy,
                    fit: BoxFit.cover,
                    height: 55.0,
                    width: 55.0,
                  ),
                ],
              ),
            ),

            Container(
              alignment: Alignment.topCenter,
              width: media.width,
              height: media.height * 0.1,
              //padding: EdgeInsets.only(left: media.width * 0.08),
              child: Image(
                image: AssetImage(FondoTimer),
                fit: BoxFit.fill,
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: media.height * 0.015),
              child: CountDown(
                animation: StepTween(begin: limitTime, end: 0).animate(_controllerTimer),
              ),
            ),

/*             Container(
              alignment: Alignment.topCenter,
              child: Text(
                showtimer,
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Times New Roman',
                  color: Colors.white,
                ),
              ),
            ), */
            // condicion if
            //score==0 ? Container() : Container(),
/*             Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 45.0, left: 50.0),
                  child: Image.asset(
                    FondoPreguntas,
                    width: 590.0,
                    height: 65.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: media.height * 0.109,
                      left: media.width * 0.095,
                      right: media.width * 0.087),
                  child: Text(
                    'N° ${numQuestion + 1} ' + listQuestions[numQuestion].textQ,
                    style: TextStyle(color: Colors.black87, fontSize: 20.0),
                  ),
                ),
                listQuestions[numQuestion].typeQ == 'picture'
                    ? imageQuestion(listQuestions[numQuestion].imgQ, true)
                    : imageQuestion('no hay nada', false),
              ],
            ), */

            /* : Container(
                    padding: EdgeInsets.only(top: 100.0, left: 300.0),
                    child: Text('no hay nada'),
                  ), */
/*                 Visibility(
                    visible: true,
                    child: Container(),
                  ), */

            Container(
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: media.height * 0.99,
                        width: media.width,
                        padding: EdgeInsets.only(top: 30.0),
                        //alignment: Alignment.bottomCenter,
                        child: FlareActor(
                          enemySelct,
                          animation: _animacionEnemy,
                          fit: BoxFit.contain,
                          controller: _controlsEnemigo,
                        ),
                      ),
                      Container(
                        height: media.height * 0.99,
                        width: media.width,
                        padding: EdgeInsets.only(top: 20.0),
                        child: FlareActor(
                          '${prefs.personajeSeleccionado}',
                          animation: _animacionHero,
                          fit: BoxFit.contain,
                          controller: _controlsPersonje,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //newMethod(context),
            Visibility(
              visible: _optionState,
              child: Container(
                padding: EdgeInsets.only(top: 260.0),
                child: FutureBuilder(
                  future: getOptionQuestion(listQuestions[numQuestion].id),
                  initialData: [],
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    _snapshotOp = snapshot;
                    return optionWidget(context);
                  },
                ),
              ),
            ),
            Container(
              child: listQuestions[numQuestion].typeQ == 'picture'
                  ? _questionImage(media)
                  : listQuestions[numQuestion].typeQ == 'audio'
                      ? _questionSound(media)
                      : _questionText(media),
            ),
          ],
        ),
      ),
    );
  }

/*   Container newMethod(BuildContext context) {
    final _optionsProvider = Provider.of<OptionsProvider>(context, listen: false);
    _optionsProvider.cargarOpcionesPregunta(listQuestions[numQuestion].id);
    final _op = _optionsProvider.options;
    return Container(
      padding: EdgeInsets.only(top: 200.0, left: 150),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _op == null ? 0 : _op.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(_op[index].textO);
        },
      ),
    );
  } */

  Future<List<Option>> getOptionQuestion(int id) async {
    var result = await OptionModel().getOptionQuestionById(id);
    return result;
  }

  Widget optionWidget(BuildContext context) {
    //var values = snapshot.data;
    var values = _snapshotOp.data;

    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: values == null ? 0 : values.length,
        itemBuilder: (BuildContext context, int index) {
          //print(index);

          return Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: MaterialButton(
              onPressed: () {
                if (_isButtonDisabled) {
                  return null;
                } else {
                  //_controllerTimer.stop(canceled: true);
                  return checkanswer(values[index].correctO, index);
                }
              },
              //onPressed: () => nextquestion(),
              child: Text(
                values[index].textO,
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: "Alike",
                  fontSize: 16.0,
                ),
                maxLines: 1,
              ),
              color: btncolor[index],
              splashColor: Colors.indigo,
              highlightColor: Colors.indigo[400],
              minWidth: 200.0,
              height: 45.0,
            ),
          );
        },
      ),
    );
  }

  Widget _questionImage(Size media) {
    //_withImg = media.width * 0.15;
    //_heighImg = media.height * 0.2;
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: media.height * 0.11),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            //padding: EdgeInsets.only(top: 45.0, left: 50.0),
            child: Image.asset(
              FondoPreguntas,
              width: media.width * 0.5033,
              height: media.height * 0.2879,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: media.width * 0.5033,
            height: media.height * 0.1579,
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: media.height * 0.01),
            child: Text(
              listQuestions[numQuestion].textQ,
              style: TextStyle(color: Colors.black87, fontSize: 20.0),
            ),
          ),
          Container(
            alignment: FractionalOffset.center,
            //height: media.height * 0.25,
            //width: media.width * 0.1,
            padding: EdgeInsets.only(top: media.height * 0.074),
            /*  padding: EdgeInsets.only(
                            top: media.height * 0.109, left: media.width * 0.095, right: media.width * 0.087), */

            //behavior: HitTestBehavior.translucent,
            child: GestureDetector(
              onDoubleTap: () {
                if (_dobleTapImg) {
                  setState(() {
                    _withImg = media.width;
                    _heighImg = media.height;
                    _dobleTapImg = false;
                    print('emtrp');
                  });
                } else {
                  setState(() {
                    _withImg = media.width * 0.15;
                    _heighImg = media.height * 0.2;
                    _dobleTapImg = true;
                  });
                }
              },
              child: Image.asset(
                listQuestions[numQuestion].imgQ,
                width: _withImg,
                height: _heighImg,
                fit: BoxFit.fill,
              ),
            ),

/*                               child: Image(
                              image: AssetImage(listQuestions[numQuestion].imgQ),
                              fit: BoxFit.fill,
                            ), */
          ),
        ],
      ),
    );
  }

  Widget _questionText(Size media) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: media.height * 0.11),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            //padding: EdgeInsets.only(top: 45.0, left: 50.0),
            child: Image.asset(
              FondoPreguntas,
              width: media.width * 0.8633,
              height: media.height * 0.1579,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: media.width * 0.8033,
            height: media.height * 0.1579,
            alignment: Alignment.topCenter,
/*             padding: EdgeInsets.only(
                top: media.height * 0.109, left: media.width * 0.095, right: media.width * 0.087), */
            child: Text(
              listQuestions[numQuestion].textQ,
              style: TextStyle(color: Colors.black87, fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _questionSound(Size media) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: media.height * 0.11),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            //padding: EdgeInsets.only(top: 45.0, left: 50.0),
            child: Image.asset(
              FondoPreguntas,
              width: media.width * 0.8633,
              height: media.height * 0.1579,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: media.width * 0.8033,
            height: media.height * 0.1579,
            alignment: Alignment.topCenter,
/*             padding: EdgeInsets.only(
                top: media.height * 0.109, left: media.width * 0.095, right: media.width * 0.087), */
            child: Text(
              listQuestions[numQuestion].textQ,
              style: TextStyle(color: Colors.black87, fontSize: 20.0),
            ),
          ),
          Container(
            //width: media.width * 0.8033,
            //height: media.height * 0.1579,
            padding: EdgeInsets.only(top: media.height * 0.09),
            alignment: Alignment.topCenter,
/*             padding: EdgeInsets.only(
                top: media.height * 0.109, left: media.width * 0.095, right: media.width * 0.087), */
            child: AudioWidget.assets(
              path: listQuestions[numQuestion].sndQ,
              play: _play,
              child: FloatingActionButton(
                  backgroundColor: _play ? Colors.red : Colors.green,
                  child: _play ? Icon(Icons.pause) : Icon(Icons.play_arrow),
/*                   child: Text(
                    _play ? "pause" : "play",
                  ), */
                  onPressed: () {
                    setState(() {
                      _play = !_play;
                    });
                    if (_play) {
                      _controllerTimer.stop();
                    } else {
                      _controllerTimer.forward();
                    }
                  }),
              onReadyToPlay: (duration) {
                //onReadyToPlay
              },
              onPositionChanged: (current, duration) {
                //onPositionChanged
              },
              onFinished: () {
                setState(() {
                  _play = false;
                });
                _controllerTimer.forward();
              },
            ),
          ),
        ],
      ),
    );
  }

  num formatNumero(num numero) {
    var f = NumberFormat("###.0#");
    num n = num.parse(f.format(numero));
    return n;
  }

  void _condion() {
    print('entro');
  }
}
