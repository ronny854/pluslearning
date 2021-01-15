import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:learning_appfinal/others/constans.dart';
import 'package:learning_appfinal/views/game.dart';

class EnviarPreguntas extends StatelessWidget {
  String topic;
  EnviarPreguntas(this.topic);
  String assettoload;
  setasset() {
    switch (topic) {
      case Tema1:
        assettoload = P_Tema1;
        break;
      case Tema2:
        assettoload = P_Tema2;
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    setasset();
    // and now we return the FutureBuilder to load and decode JSON
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString(assettoload, cache: false),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text(
                "Loading",
              ),
            ),
          );
        } else {
          return Game();
        }
      },
    );
  }
}
