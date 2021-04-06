import 'package:flutter/material.dart';
import 'package:learning_appfinal/others/constans.dart';

class Score extends StatelessWidget {
  Score({Key key, this.points}) : super(key: key);
  int points;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            ScoreWin,
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
                    return Navigator.pushNamed;
                  },
                  child: Text('Continue'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
