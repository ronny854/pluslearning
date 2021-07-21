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
  String _textoD = "";
  bool _isBlock = false;
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
            _isBlock == true ? _pressSelect(_screenSize) : _characterSelect(_screenSize),
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
                      _buttonCharacter(_screenSize, Personaje_1, IconP1),
                      prefs.personaje1B == true
                          ? _buttonBlock(_screenSize, IconPBloqueado,
                              "Locked character.\nGet 200 points in any game mode to unlock the character.")
                          : _buttonCharacter(_screenSize, Personaje_2, IconP2),
                    ],
                  ),
                  Row(
                    children: [
                      prefs.personaje2B == true
                          ? _buttonBlock(_screenSize, IconPBloqueado,
                              "Locked character.\nGet 500 points in any game mode to unlock the character.")
                          : _buttonCharacter(_screenSize, Personaje_3, IconP3),
                      prefs.personaje3B == true
                          ? _buttonBlock(_screenSize, IconPBloqueado,
                              "Locked character.\nGet 800 points in any game mode to unlock the character.")
                          : _buttonCharacter(_screenSize, Personaje_4, IconP4),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buttonCharacter(Size _screenSize, String personaje, String icon) {
    return Container(
      width: _screenSize.width * 0.15,
      height: _screenSize.height * 0.3,
      padding: EdgeInsets.all(_screenSize.height * 0.01),
      child: GestureDetector(
        child: Image(
          image: AssetImage(icon),
          fit: BoxFit.fill,
        ),
        onTap: () => {changeHero(personaje, icon)},
      ),
    );
  }

  Container _buttonBlock(Size _screenSize, String icon, String texto) {
    return Container(
      width: _screenSize.width * 0.15,
      height: _screenSize.height * 0.3,
      padding: EdgeInsets.all(_screenSize.height * 0.01),
      child: GestureDetector(
        child: Image(
          image: AssetImage(icon),
          fit: BoxFit.fill,
        ),
        onTap: () => {changeBlock(texto)},
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

  Container _pressSelect(Size _screenSize) {
    return Container(
      padding: EdgeInsets.only(top: _screenSize.height * 0.3, left: _screenSize.width * 0.04),
      child: Container(
        alignment: Alignment.center,
        width: _screenSize.width * 0.40,
        height: _screenSize.height * 0.3,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 4,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        //padding: EdgeInsets.only(top: _screenSize.height * 0.2, left: _screenSize.width * 0.01),
        child: Text(
          _textoD,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15.0),
        ),
      ),
    );
  }

  void changeHero(String personaje, String iconSelect) {
    setState(() {
      _isBlock = false;
      prefs.personajeSeleccionado = personaje;
      prefs.iconPersonajeS = iconSelect;
    });
  }

  void changeBlock(String texto) {
    setState(() {
      _isBlock = true;
      _textoD = texto;
    });
  }
}
