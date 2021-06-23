import 'package:flutter/material.dart';
import 'package:learning_appfinal/others/constans.dart';
import 'package:google_fonts/google_fonts.dart';

Widget botonMenu(String titulo, String nextPage, BuildContext context) {
  var _media = MediaQuery.of(context).size;
  double _sizeText = _media.height * 0.065;
  return Container(
    padding: EdgeInsets.only(left: _media.width * 0.01),
    child: GestureDetector(
      onTap: () {
        return Navigator.pushNamed(context, nextPage);
      },
      //onTap: () => null,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            Boton1,
            height: _media.height * 0.12,
            width: _media.width * 0.25,
            fit: BoxFit.fill,
          ),
          Container(
            //padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
            child: Text(
              titulo,
              style: GoogleFonts.zcoolKuaiLe(
                  textStyle: TextStyle(color: Colors.white, fontSize: _sizeText)),
            ),
          ),
          SizedBox(
            height: _media.height * 0.14,
          ),
        ],
      ),
    ),
  );
}

Widget botonTemas(String titulo, BuildContext context) {
  return Container(
    child: GestureDetector(
      onTap: () {
/*         Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => EnviarPreguntas(titulo),
        )); */
        Navigator.pushNamed(context, 'juego');
      },
      //onTap: () => null,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            Boton1,
            height: 50.0,
            width: 250.0,
            fit: BoxFit.contain,
          ),
          Container(
            //padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
            child: Text(titulo),
          ),
          SizedBox(
            height: 70.0,
          )
        ],
      ),
    ),
  );
}

TextStyle titulosR(var _screenSize) {
  return GoogleFonts.lobster(
      textStyle: TextStyle(color: Colors.white, fontSize: _screenSize.width * 0.04));
}

TextStyle titulosEn(var _screenSize) {
  return GoogleFonts.karla(
      textStyle: TextStyle(color: Colors.white, fontSize: _screenSize.width * 0.025));
}
