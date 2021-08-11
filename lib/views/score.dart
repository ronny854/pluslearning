import 'package:flutter/material.dart';
import 'package:learning_appfinal/others/constans.dart';
import 'package:learning_appfinal/others/preferences.dart';

class Score extends StatelessWidget {
  Score({Key key, this.points, this.winner, this.idtema}) : super(key: key);
  int points;
  bool winner;
  int idtema;
  final prefs = new Preferences();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    String notification = '\nYour performance is below 30% check the suggestions on this topic.';
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              winner == true ? ScoreWin : ScoreLost,
              fit: BoxFit.contain,
              height: media.height,
              width: media.width,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 150.0),
              child: Column(
                children: [
                  Text('Your Score'),
                  Text(
                    '$points',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Container(
                    height: media.height * 0.15,
                    width: media.width * 0.35,
                    child: prefs.notificationG && idtema == 1
                        ? Text(notification)
                        : prefs.notificationR && idtema == 2
                            ? Text(notification)
                            : prefs.notificationL && idtema == 3
                                ? Text(notification)
                                : prefs.notificationV && idtema == 4
                                    ? Text(notification)
                                    : Text(''),
                  ),
                  MaterialButton(
                    onPressed: () {
                      //return Navigator.pushReplacementNamed(context, "temas");
                      //return Navigator.of(context).pop();
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Text('Continue'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
