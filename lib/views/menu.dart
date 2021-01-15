import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:learning_appfinal/others/constans.dart';
import 'package:learning_appfinal/widgets/buttons.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    double distancia = media.height * 0.5278;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              child: FlareActor(
                Introanimacion,
                animation: "menu",
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.only(top: distancia),
                child: Column(
                  children: [
                    botonMenu('Play', 'temas', context),
                    botonMenu('Profile', 'perfil', context),
                    botonMenu('Settings', 'conf', context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
