import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          width: _media.width,
          height: _media.height,
          child: Image.asset(
            'assets/imagenes/about game.png',
            fit: BoxFit.fill,
          )),
    );
  }
}
