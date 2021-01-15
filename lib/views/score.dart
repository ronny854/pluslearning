import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  Score({Key key, this.points}) : super(key: key);
  int points;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('$points'),
    );
  }
}
