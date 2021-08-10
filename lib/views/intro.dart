import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:learning_appfinal/others/constans.dart';
import 'package:learning_appfinal/views/menu.dart';

class Intro extends StatefulWidget {
  Intro({Key key}) : super(key: key);

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Menu(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    var _media = MediaQuery.of(context).size;
    var ancho = _media.width;
    var alto = _media.height;
    print("ancho-width= $ancho  alto-height =$alto");
    return Scaffold(
      body: Container(
        height: _media.height,
        width: _media.width,
        child: FlareActor(
          Introanimacion,
          animation: "intro",
          alignment: Alignment.center,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
