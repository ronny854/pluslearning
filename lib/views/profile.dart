import 'package:flutter/material.dart';
import 'package:learning_appfinal/others/constans.dart';
//import 'package:learning_appfinal/others/state_manager.dart';
import 'package:learning_appfinal/models/topics_model.dart';
import 'package:learning_appfinal/models/pointsA_model.dart';
import 'package:learning_appfinal/others/preferences.dart';
import 'package:learning_appfinal/views/recomendsG.dart';
import 'package:learning_appfinal/views/recomendsL.dart';
import 'package:learning_appfinal/views/recomendsR.dart';
import 'package:learning_appfinal/views/recomendsV.dart';
import 'package:learning_appfinal/widgets/buttons.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';

//scroll_snap_list
class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int idTopics = 1;
  String _tema = "Grammar";
  final prefs = new Preferences();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            FondoTemas,
            fit: BoxFit.cover,
            height: media.height,
            width: media.width,
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 30.0, left: 20.0),
                child: Column(
                  children: [
                    Text(
                      'Game Mode',
                      style: titulosR(media),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 250.0,
                      child: FutureBuilder(
                        future: getTopics(),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return CircularProgressIndicator();
                          } else {
                            return leftPart(context, snapshot);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 50.0, left: (media.width / 2) - 200.0),
                child: FutureBuilder(
                  future: getPointsA(idTopics),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      return rightPart(context, snapshot);
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<List<Topic>> getTopics() async {
    var result = await TopicModel().getTopics();
    //context.read(topicListProvider).state = result;
    return result;
  }

  Future<List<PointsA>> getPointsA(int id) async {
    //print('entro aqui $id');
    var result = await PointsAModel().getPointsAById(id);
    //context.read(topicListProvider).state = result;
    return result;
  }

  Widget leftPart(BuildContext context, AsyncSnapshot snapshot) {
    return SingleChildScrollView(
      //controller: controller,
      child: Column(
        children: snapshot.data.map<Widget>((topic) {
          return GestureDetector(
            onTap: () {
              setState(() {
                idTopics = topic.id;
                _tema = topic.name;
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  Boton1,
                  height: 50.0,
                  width: 250.0,
                  fit: BoxFit.contain,
                ),
                Container(
                  //padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                  child: Text('${topic.name}'),
                ),
                SizedBox(
                  height: 70.0,
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget rightPart(BuildContext context, AsyncSnapshot snapshot) {
    return Column(
      children: snapshot.data.map<Widget>((pointsA) {
        return Column(
          children: [
            Text('$_tema'),
            SizedBox(height: 20.0),
            Text('Total Score:  ${pointsA.scoreT}'),
            SizedBox(height: 20.0),
            Text('Total correct questions:  ${pointsA.numQuesC}'),
            SizedBox(height: 20.0),
            Text('Total incorrect questions : ${pointsA.numQuesIn}'),
            SizedBox(height: 20.0),
            Text('Performance topic'),
            LinearPercentIndicator(
              width: 140.0,
              lineHeight: 14.0,
              percent: pointsA.porcentajeDe,
              center: Text(
                '${pointsA.porcentajeDe * 100.0} %',
                style: new TextStyle(fontSize: 12.0),
              ),
              trailing: Icon(Icons.mood),
              linearStrokeCap: LinearStrokeCap.roundAll,
              backgroundColor: Colors.grey,
              progressColor: Colors.blue,
            ),
            pointsA.idTo == 1 && prefs.notificationG
                ? Container(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecomendsG(),
                            ));
                      },
                      child: Text('Suggestions'),
                    ),
                  )
                : pointsA.idTo == 2 && prefs.notificationR
                    ? Container(
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RecomendsR(),
                                ));
                          },
                          child: Text('Recommendations'),
                        ),
                      )
                    : pointsA.idTo == 3 && prefs.notificationL
                        ? Container(
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RecomendsL(),
                                    ));
                              },
                              child: Text('Recommendations'),
                            ),
                          )
                        : pointsA.idTo == 4 && prefs.notificationV
                            ? Container(
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RecomendsV(),
                                        ));
                                  },
                                  child: Text('Recommendations'),
                                ),
                              )
                            : Container(
                                child: Text(''),
                              ),
          ],
        );
      }).toList(),
    );
  }
}
