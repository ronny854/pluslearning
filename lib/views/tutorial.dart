import 'package:flutter/material.dart';

class Tutorial extends StatefulWidget {
  Tutorial({Key key}) : super(key: key);

  @override
  _TutorialState createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('tutorial'),
    );
  }
}
