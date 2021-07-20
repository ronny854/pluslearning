import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:learning_appfinal/others/constans.dart';
import 'package:learning_appfinal/widgets/buttons.dart';

class RecomendsG extends StatefulWidget {
  RecomendsG({Key key}) : super(key: key);

  @override
  _RecomendsGState createState() => _RecomendsGState();
}

class _RecomendsGState extends State<RecomendsG> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    var _imagenesRecom = [ImagenR1, ImagenR1];
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
                Container(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.only(top: _screenSize.height * 0.05),
                        child: Text(
                          "Recommendations for 'Grammar'",
                          style: titulosR(_screenSize),
                        ),
                      ),
                      Container(
                        //height: _screenSize.height,
                        width: _screenSize.width * 0.95,
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: _screenSize.height * 0.05),
                        child: Text(
                          'To master the grammar the most important thing is to know the structure of the sentences and follow their order, slide your finger to see the grammatical structures of the language.',
                          style: titulosEn(_screenSize),
                        ),
                      ),
                      Container(
                        width: _screenSize.width * 0.90,
                        height: _screenSize.height * 0.65,
                        padding: EdgeInsets.only(top: _screenSize.height * 0.01),
                        child: Swiper(
                          itemBuilder: (_, int index) {
                            return new Image.asset(
                              _imagenesRecom[index],
                              fit: BoxFit.fill,
                            );
                          },
                          itemCount: 2,
                          viewportFraction: 0.8,
                          scale: 0.9,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
