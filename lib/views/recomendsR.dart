import 'package:flutter/material.dart';
import 'package:learning_appfinal/others/constans.dart';
import 'package:learning_appfinal/widgets/buttons.dart';

class RecomendsR extends StatefulWidget {
  RecomendsR({Key key}) : super(key: key);

  @override
  _RecomendsRState createState() => _RecomendsRState();
}

class _RecomendsRState extends State<RecomendsR> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Stack(
              children: [
                Image.asset(
                  FondoTemas,
                  fit: BoxFit.cover,
                  height: _screenSize.height,
                  width: _screenSize.width,
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: _screenSize.height * 0.09),
                      child: Text(
                        "Recomendaciones para 'Reading'",
                        style: titulosR(_screenSize),
                      ),
                    ),
                    Container(
                      //height: _screenSize.height,
                      width: _screenSize.width * 0.95,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: _screenSize.height * 0.05),
                      child: Text(
                        '- Comienza leyendo textos sencillos, que estén a tu nivel y que sean interesantes para ti.',
                        style: titulosEn(_screenSize),
                      ),
                    ),
                    Container(
                      //height: _screenSize.height,
                      width: _screenSize.width * 0.95,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: _screenSize.height * 0.05),
                      child: Text(
                        '- Una vez hayas terminado con el capítulo del libro o el texto que estás leyendo, vuelve a leerlo en voz alta. ',
                        style: titulosEn(_screenSize),
                      ),
                    ),
                    Container(
                      //height: _screenSize.height,
                      width: _screenSize.width * 0.95,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: _screenSize.height * 0.05),
                      child: Text(
                        '- Mientras lees debes tener siempre a mano un cuaderno para ir apuntando todas las palabras nuevas que todavía no entiendes.',
                        style: titulosEn(_screenSize),
                      ),
                    ),
                    Container(
                      //height: _screenSize.height,
                      width: _screenSize.width * 0.95,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: _screenSize.height * 0.05),
                      child: Text(
                        '- Escribir un resumen de lo leído con tus propias palabras puede resultar muy útil. ',
                        style: titulosEn(_screenSize),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
