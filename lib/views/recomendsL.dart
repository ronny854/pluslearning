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
                        "Recommendations for 'Listening'",
                        style: titulosR(_screenSize),
                      ),
                    ),
                    Container(
                      //height: _screenSize.height,
                      width: _screenSize.width * 0.95,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: _screenSize.height * 0.05),
                      child: Text(
                        '- Get used to initially listening to the audio without relying on the text or transcription of it.',
                        style: titulosEn(_screenSize),
                      ),
                    ),
                    Container(
                      //height: _screenSize.height,
                      width: _screenSize.width * 0.95,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: _screenSize.height * 0.05),
                      child: Text(
                        '- Work with audios (or videos) entirely in English and separately with their transcription.',
                        style: titulosEn(_screenSize),
                      ),
                    ),
                    Container(
                      //height: _screenSize.height,
                      width: _screenSize.width * 0.95,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: _screenSize.height * 0.05),
                      child: Text(
                        "- Don't translate the words. Try to understand the main idea of the sentence and you will see that the rest of the words and phrases will be understood according to the context in which they are found.",
                        style: titulosEn(_screenSize),
                      ),
                    ),
                    Container(
                      //height: _screenSize.height,
                      width: _screenSize.width * 0.95,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: _screenSize.height * 0.05),
                      child: Text(
                        '- If you have a favorite series that you already know the plot of, watch it again in English with the subtitles in the same language.',
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
