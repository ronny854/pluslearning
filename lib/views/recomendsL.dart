import 'package:flutter/material.dart';
import 'package:learning_appfinal/others/constans.dart';
import 'package:learning_appfinal/widgets/buttons.dart';

class RecomendsL extends StatefulWidget {
  RecomendsL({Key key}) : super(key: key);

  @override
  _RecomendsLState createState() => _RecomendsLState();
}

class _RecomendsLState extends State<RecomendsL> {
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
                        "Recomendaciones para 'Listening'",
                        style: titulosR(_screenSize),
                      ),
                    ),
                    Container(
                      //height: _screenSize.height,
                      width: _screenSize.width * 0.95,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: _screenSize.height * 0.05),
                      child: Text(
                        '- Acostúmbrate en general a escuchar inicialmente el audio sin apoyarte en el texto o trascripción del mismo.',
                        style: titulosEn(_screenSize),
                      ),
                    ),
                    Container(
                      //height: _screenSize.height,
                      width: _screenSize.width * 0.95,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: _screenSize.height * 0.05),
                      child: Text(
                        '- Trabaja con audios (o vídeos) íntegramente en inglés y de forma separada con su trascripción en inglés.',
                        style: titulosEn(_screenSize),
                      ),
                    ),
                    Container(
                      //height: _screenSize.height,
                      width: _screenSize.width * 0.95,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: _screenSize.height * 0.05),
                      child: Text(
                        '- No traduzcas las palabras. Intenta comprender la idea principal de la oración y verás que el resto de las palabras y frases las comprenderás de acuerdo al contexto en el que se encuentren.',
                        style: titulosEn(_screenSize),
                      ),
                    ),
                    Container(
                      //height: _screenSize.height,
                      width: _screenSize.width * 0.95,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: _screenSize.height * 0.05),
                      child: Text(
                        '- Si tienes alguna serie favorita de la que ya conoces la trama, mírala de nuevo en inglés con los subtítulos en el mismo idioma.',
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
