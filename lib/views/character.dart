import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learning_appfinal/others/constans.dart';
import 'package:learning_appfinal/others/preferences.dart';

class Character extends StatefulWidget {
  Character({Key key}) : super(key: key);

  @override
  _CharacterState createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  final prefs = new Preferences();
  //String _personajeSelect = prefs.personajeSeleccionado;

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              SelectPersonaje,
              fit: BoxFit.cover,
              height: _screenSize.height,
              width: _screenSize.width,
            ),
            Container(
              padding: EdgeInsets.only(
                top: _screenSize.height * 0.01,
                left: _screenSize.width * 0.50,
                bottom: _screenSize.height * 0.02,
                right: _screenSize.width * 0.01,
              ),
              width: _screenSize.width,
              height: _screenSize.height,
              child: Image(
                image: AssetImage(FondoPersonaje),
                fit: BoxFit.fill,
              ),
            ),

            _characterSelect(_screenSize),

            Container(
              padding:
                  EdgeInsets.only(top: _screenSize.height * 0.10, left: _screenSize.width * 0.59),
              child: Text(
                "Select your character",
                style: GoogleFonts.lobster(
                    textStyle: TextStyle(color: Colors.white, fontSize: _screenSize.width * 0.04)),
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(top: _screenSize.height * 0.25, left: _screenSize.width * 0.595),
              child: Column(
                children: [
                  Row(
                    children: [
                      _buttonCharacter(_screenSize, Personaje_1, 'personaje 1', IconP1),
                      _buttonCharacter(_screenSize, Personaje_2, 'personaje 2', IconP2),
                    ],
                  ),
                  Row(
                    children: [
                      _buttonCharacter(_screenSize, Personaje_3, 'personaje 3', IconP3),
                      _buttonCharacter(_screenSize, Personaje_4, 'personaje 4', IconP4),
                    ],
                  ),
                ],
              ),
            ),

            //_characterSelect(_screenSize, Personaje_1),
          ],
        ),
      ),
    );
  }

  Container _buttonCharacter(Size _screenSize, String personaje, String texto, String icon) {
    return Container(
      width: _screenSize.width * 0.15,
      height: _screenSize.height * 0.3,
      padding: EdgeInsets.all(_screenSize.height * 0.01),
      child: GestureDetector(
        child: Image(
          image: AssetImage(icon),
          fit: BoxFit.fill,
        ),
        onTap: () => {changeHero(personaje)},
      ),
    );
  }

  Container _characterSelect(Size _screenSize) {
    return Container(
      width: _screenSize.width,
      height: _screenSize.height * 0.75,
      padding: EdgeInsets.only(top: _screenSize.height * 0.2, left: _screenSize.width * 0.01),
      child: FlareActor(
        '${prefs.personajeSeleccionado}',
        animation: "espera",
        fit: BoxFit.fill,
      ),
    );
  }

  void changeHero(String personaje) {
    setState(() => {prefs.personajeSeleccionado = personaje});
  }
}
