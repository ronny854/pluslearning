import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:learning_appfinal/logic/envioPreguntas.dart';
import 'package:learning_appfinal/models/topics_model.dart';
import 'package:learning_appfinal/others/constans.dart';
import 'package:learning_appfinal/others/preferences.dart';
import 'package:learning_appfinal/providers/topics_provider.dart';
import 'package:provider/provider.dart';
//import 'package:learning_appfinal/others/state_manager.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';

class Topics extends StatefulWidget {
  Topics({Key key}) : super(key: key);

  @override
  _TopicsState createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  @override
  Widget build(BuildContext context) {
    final topicsProvider = Provider.of<TopicsProvider>(context);
    final topicP = topicsProvider.topics;
    final prefs = new Preferences();
    setState(() {
      prefs.tutorialGame = false;
    });

    var _screenSize = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              FondoTemas,
              fit: BoxFit.cover,
              height: _screenSize.height,
              width: _screenSize.width,
            ),
            Center(
              child: Container(
                child: Swiper(
                  itemBuilder: (_, int i) {
                    return GestureDetector(
                      onTap: () {
                        //print('holaa');
                        if (topicP[i].id == 1 && prefs.calibrateGrammar == false) {
                          prefs.isCalibrating = true;
                          alertCalibrate(context, topicP, i);
                        } else if (topicP[i].id == 2 && prefs.calibrateReading == false) {
                          prefs.isCalibrating = true;
                          alertCalibrate(context, topicP, i);
                        } else if (topicP[i].id == 3 && prefs.calibrateListening == false) {
                          prefs.isCalibrating = true;
                          alertCalibrate(context, topicP, i);
                        } else if (topicP[i].id == 4 && prefs.calibrateVocabulary == false) {
                          prefs.isCalibrating = true;
                          alertCalibrate(context, topicP, i);
                        } else {
                          prefs.isCalibrating = false;
                          envioPreguntasGame(context, topicP, i);
                        }
                      },
                      child: Container(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              BotonTopic,
                              width: _screenSize.width,
                              height: _screenSize.height * 0.55,
                            ),
                            Container(
                              //padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                              child: Text(
                                topicP[i].name,
                                style: GoogleFonts.pacifico(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 60.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 4,
                  viewportFraction: 0.7,
                  scale: 0.8,
                  //pagination: new SwiperPagination(),
                  //control: new SwiperControl(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> alertCalibrate(BuildContext context, List<Topic> topicP, int i) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Start calibration.'),
        content: Text(
            'This game will serve to evaluate your level of English and adjust the difficulty. Therefore, you will not be able to DO or RECEIVE damage until you complete the calibration questions.'),
        actions: [
          TextButton(child: Text('No'), onPressed: () => Navigator.of(context).pop()),
          TextButton(
            child: Text('Yes'),
            onPressed: () {
              Navigator.of(context).pop();
              envioPreguntasGame(context, topicP, i);
            },
          ),
        ],
      ),
    );
  }

  void envioPreguntasGame(BuildContext context, List<Topic> topicP, int i) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ePreguntas(
        idTemaPregunta: topicP[i].id,
        score: topicP[i].scoreT,
      );
    }));
  }
}
