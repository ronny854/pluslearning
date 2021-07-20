import 'package:flutter/material.dart';
import 'package:learning_appfinal/others/constans.dart';

class Score extends StatelessWidget {
  Score({Key key, this.points, this.winner}) : super(key: key);
  int points;
  bool winner;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
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
                  Text('You Score'),
                  Text('$points'),
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
