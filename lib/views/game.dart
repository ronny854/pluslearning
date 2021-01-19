import 'dart:async';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';
import 'package:learning_appfinal/conexion/db_helper.dart';
import 'package:learning_appfinal/others/constans.dart';
import 'package:learning_appfinal/providers/options_provider.dart';
import 'package:learning_appfinal/providers/questions_provider.dart';
import 'package:learning_appfinal/views/score.dart';

/* class Game extends StatefulWidget {
  final List mydata;
  Game({Key key, @required this.mydata}) : super(key: key);

  @override
  _GameState createState() => _GameState(mydata);
} */
// ignore: must_be_immutable
class Game extends StatefulWidget {
  final List<Question> listQuestions;
  Game({Key key, this.listQuestions}) : super(key: key);

  @override
  _GameState createState() => _GameState(listQuestions);
}

class _GameState extends State<Game> {
  final List<Question> listQuestions;

  _GameState(this.listQuestions);
  int numQuestion = 0;

  ////////////////////////////////////////////////////////////////////////
  String animacion = Espera;
  final FlareControls _controlsPersonje = FlareControls();
  final FlareControls _controlsEnemigo = FlareControls();

  Color colortoshow = Colors.indigoAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;
  Color defaul = Colors.indigo;
  int points = 0;
  int i = 1;
  bool disableAnswer = false;
  // extra varibale to iterate
  int j = 1;
  int timer = 30;
  String showtimer = "30";
  //var random_array;

  Map<int, Color> btncolor = {
    0: Colors.indigoAccent,
    1: Colors.indigoAccent,
    2: Colors.indigoAccent,
    3: Colors.indigoAccent,
    4: Colors.indigoAccent,
    5: Colors.indigoAccent,
    6: Colors.indigoAccent,
    7: Colors.indigoAccent,
  };

  bool canceltimer = false;
  bool questionState = false;
  bool optionState = false;
  bool _isButtonDisabled;
  @override
  void initState() {
    //starttimer();
    //genrandomarray();
    //print(lisaPreguntas);
    _isButtonDisabled = false;
    super.initState(); //print('game $idquestionTopic');
  }

  // overriding the setstate function to be called only if mounted
/*   @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  } */

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

/*   void nextquestion() {
    canceltimer = false;
    timer = 30;
    setState(() {
      if (j < 5) {
        i = random_array[j];
        j++;
      } else {
        /*  Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Score(marks: marks),
        )); */
      }
      btncolor["a"] = Colors.indigoAccent;
      btncolor["b"] = Colors.indigoAccent;
      btncolor["c"] = Colors.indigoAccent;
      btncolor["d"] = Colors.indigoAccent;
      disableAnswer = false;
    });
    starttimer();
  } */

  void checkanswer(int correctO, int posColor) {
    _isButtonDisabled = true;
    if (correctO == 1) {
      points = points + listQuestions[numQuestion].score;
      colortoshow = right;
      setState(() {
        animacion = Ataque;
        _controlsPersonje.play(animacion);
        _controlsPersonje.onCompleted(animacion = Espera);
      });
    } else {
      colortoshow = wrong;
      setState(() {
        animacion = Ataque;
        _controlsEnemigo.play(animacion);
        _controlsEnemigo.onCompleted(animacion = Espera);
      });
    }
    setState(() {
      // applying the changed color to the particular button that was selected
      btncolor[posColor] = colortoshow;
      //colorboton[posColor] = colortoshow;
      canceltimer = true;
      disableAnswer = true;
    });
    // nextquestion();
    // changed timer duration to 1 second
    Timer(Duration(milliseconds: 2000), nextquestion);
  }

  void nextquestion() {
    //canceltimer = false;
    //timer = 30;
    //questionState = false;

    setState(() {
      _isButtonDisabled = false;
      if (numQuestion < listQuestions.length - 1) {
        numQuestion++;
      } else {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            //print(topic.id);
            return Score(
              points: points,
            );
          }));
        });
      }
      for (var i = 0; i < btncolor.length; i++) {
        btncolor[i] = defaul;
      }
    });
    //starttimer();
  }

  /*  Widget botonOpcion(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        //onPressed: () => checkanswer(k),
        onPressed: () {
          if (_isButtonDisabled) {
            return null;
          } else {
            return nextquestion();
          }
        },

        child: Text(
          //mydata[2][i.toString()][k],
          'opcion',
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Alike",
            fontSize: 16.0,
          ),
          maxLines: 1,
        ),
        color: btncolor[k],
        splashColor: Colors.indigo[700],
        highlightColor: Colors.indigo[700],
        minWidth: 200.0,
        height: 45.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  } */

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              child: Image.asset(
                Escenario1,
                fit: BoxFit.cover,
                height: media.height,
                width: media.width,
              ),
            ),
            Container(
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
            ),
            Container(
              padding: EdgeInsets.only(top: 50.0, left: 125.0),
              child: Text(
                'N° ${numQuestion + 1} ' + listQuestions[numQuestion].textQ,
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      height: media.height,
                      width: media.width,
                      padding: EdgeInsets.only(top: 50.0),
                      child: FlareActor(
                        Personaje1,
                        animation: animacion,
                        fit: BoxFit.contain,
                        controller: _controlsPersonje,
                      ),
                    ),
                    Container(
                      height: media.height,
                      width: media.width,
                      padding: EdgeInsets.only(left: 10.0, top: 55.0),
                      //alignment: Alignment.bottomCenter,
                      child: FlareActor(
                        Enemigo,
                        animation: animacion,
                        fit: BoxFit.contain,
                        controller: _controlsEnemigo,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 260.0),
              child: FutureBuilder(
                future: getOptionQuestion(listQuestions[numQuestion].id),
                initialData: [],
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return optionWidget(context, snapshot);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<List<Option>> getOptionQuestion(int id) async {
    var db = await copyDB();
    var result = await OptionProvider().getOptionQuestionById(db, id);
    return result;
  }

  Widget optionWidget(BuildContext context, AsyncSnapshot snapshot) {
    var values = snapshot.data;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: values == null ? 0 : values.length,
      itemBuilder: (BuildContext context, int index) {
        print(index);
        if (optionState == false) {
          return Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: MaterialButton(
              onPressed: () {
                if (_isButtonDisabled) {
                  return null;
                } else {
                  return checkanswer(values[index].correctO, index);
                }
              },
              //onPressed: () => nextquestion(),
              child: Text(
                values[index].textO,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Alike",
                  fontSize: 16.0,
                ),
                maxLines: 1,
              ),
              color: btncolor[index],
              splashColor: Colors.indigo[700],
              highlightColor: Colors.indigo[700],
              minWidth: 200.0,
              height: 45.0,
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
