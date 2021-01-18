import 'package:flutter/material.dart';
import 'package:learning_appfinal/others/constans.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

//scroll_snap_list
class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                padding: EdgeInsets.only(top: 50.0, left: 20.0),
                child: Column(
                  children: [
                    Text('Name player: Ronny'),
                    SizedBox(
                      height: 40.0,
                    ),
                    Container(
                      height: 250.0,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Card(
                                child:
                                    Text('temaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')),
                            Card(child: Text('tema')),
                            Card(child: Text('tema')),
                            Card(child: Text('tema')),
                            Card(child: Text('tema')),
                            Card(child: Text('tema')),
                            Card(child: Text('tema')),
                            Card(child: Text('tema')),
                            Card(child: Text('tema')),
                            Card(child: Text('tema')),
                            Card(child: Text('tema')),
                            Card(child: Text('tema2')),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 50.0, left: (media.width / 2) - 150.0),
                child: Column(
                  children: [
                    Text('Total preguntas'),
                    Text('preguntas correctas'),
                    Text('preguntas incorrectas'),
                    Text('preguntas desconocidas'),
                    Text('Porcentaje tema'),
                    LinearPercentIndicator(
                      width: 140.0,
                      lineHeight: 14.0,
                      percent: 0.5,
                      center: Text(
                        "50.0%",
                        style: new TextStyle(fontSize: 12.0),
                      ),
                      trailing: Icon(Icons.mood),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      backgroundColor: Colors.grey,
                      progressColor: Colors.blue,
                    ),
                    Text('desempeño tema'),
                    LinearPercentIndicator(
                      width: 140.0,
                      lineHeight: 14.0,
                      percent: 0.5,
                      center: Text(
                        "50.0%",
                        style: new TextStyle(fontSize: 12.0),
                      ),
                      trailing: Icon(Icons.mood),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      backgroundColor: Colors.grey,
                      progressColor: Colors.blue,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
