import 'package:flutter/material.dart';
import 'package:learning_appfinal/others/constans.dart';

Widget botonMenu(String titulo, String nextPage, BuildContext context) {
  return Container(
    child: GestureDetector(
      onTap: () => Navigator.pushNamed(context, nextPage),
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
            height: 60.0,
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
