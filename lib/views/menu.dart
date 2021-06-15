import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:learning_appfinal/others/constans.dart';
import 'package:learning_appfinal/providers/topics_provider.dart';
import 'package:learning_appfinal/widgets/buttons.dart';
import 'package:provider/provider.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    final topicsProvider = Provider.of<TopicsProvider>(context, listen: false);
    topicsProvider.cargarTemas();
    var _media = MediaQuery.of(context).size;
    double distancia = _media.height * 0.55;
    print('altura= ${_media.height} ancho= ${_media.width}');
    return Scaffold(
      body: Container(
        //alignment: Alignment.center,
        child: Stack(
          //alignment: Alignment.center,
          children: [
            Container(
              child: FlareActor(
                Introanimacion,
                animation: "menu",
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
            ),

            // flare actor para los personajes del juego
/*             Container(
              width: media.width,
              height: media.height * 0.6,
              child: FlareActor(
                Personaje2,
                animation: "prueba",
                //alignment: Alignment.center,
                fit: BoxFit.contain,
              ),
            ), */

            Container(
              padding: EdgeInsets.only(top: distancia, left: _media.width * 0.23),
              child: Column(
                children: [
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      botonMenu('Play', 'temas', context),
                      botonMenu('Profile', 'perfil', context),
                    ],
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      botonMenu('Characters', 'personaje', context),
                      botonMenu('Settings', 'conf', context),
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
