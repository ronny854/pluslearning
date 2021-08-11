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
                        "Suggestions for 'Reading'",
                        style: titulosR(_screenSize),
                      ),
                    ),
                    Container(
                      //height: _screenSize.height,
                      width: _screenSize.width * 0.95,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: _screenSize.height * 0.05),
                      child: Text(
                        '- Start by reading simple texts that are at your level and that are interesting to you.',
                        style: titulosEn(_screenSize),
                      ),
                    ),
                    Container(
                      //height: _screenSize.height,
                      width: _screenSize.width * 0.95,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: _screenSize.height * 0.05),
                      child: Text(
                        '- Once you have finished with the chapter of the book or the text that you are reading, read it aloud again. ',
                        style: titulosEn(_screenSize),
                      ),
                    ),
                    Container(
                      //height: _screenSize.height,
                      width: _screenSize.width * 0.95,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: _screenSize.height * 0.05),
                      child: Text(
                        '- While you read you should always have a notebook at hand to write down all the new words that you still do not understand.',
                        style: titulosEn(_screenSize),
                      ),
                    ),
                    Container(
                      //height: _screenSize.height,
                      width: _screenSize.width * 0.95,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: _screenSize.height * 0.05),
                      child: Text(
                        '- Writing a summary of what you read in your own words can be very useful. ',
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
