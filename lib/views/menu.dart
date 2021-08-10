import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:learning_appfinal/others/constans.dart';
import 'package:learning_appfinal/others/preferences.dart';
import 'package:learning_appfinal/providers/topics_provider.dart';
import 'package:learning_appfinal/widgets/buttons.dart';
import 'package:provider/provider.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final _prefs = new Preferences();
  @override
  Widget build(BuildContext context) {
    final topicsProvider = Provider.of<TopicsProvider>(context, listen: false);
    topicsProvider.cargarTemas();
    var _media = MediaQuery.of(context).size;
    double distancia = _media.height * 0.55;
    //print('altura= ${_media.height} ancho= ${_media.width}');
    return Scaffold(
      body: Container(
        //alignment: Alignment.center,
        child: Stack(
          //alignment: Alignment.center,
          children: [
            Container(
              height: _media.height,
              width: _media.width,
              child: FlareActor(
                Introanimacion,
                animation: "menu",
                alignment: Alignment.center,
                fit: BoxFit.fill,
              ),
            ),
            Container(
                width: _media.width * 0.35,
                child: Image.asset(
                  'assets/imagenes/logo_pucesi.png',
                  fit: BoxFit.fill,
                )),
            Container(
              padding: EdgeInsets.only(top: distancia, left: _media.width * 0.23),
              child: Column(
                children: [
                  Row(
                    children: [
                      _prefs.tutorialGame == true
                          ? botonMenu('Play', 'tutorialGame', context)
                          : botonMenu('Play', 'temas', context),
                      botonMenu('Profile', 'perfil', context),
                    ],
                  ),
                  Row(
                    children: [
                      botonMenu('Characters', 'personaje', context),
                      botonMenu('About', 'conf', context),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
