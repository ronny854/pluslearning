import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:learning_appfinal/others/constans.dart';
import 'package:learning_appfinal/widgets/buttons.dart';

class RecomendsV extends StatefulWidget {
  RecomendsV({Key key}) : super(key: key);

  @override
  _RecomendsVState createState() => _RecomendsVState();
}

class _RecomendsVState extends State<RecomendsV> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            FondoTemas,
            fit: BoxFit.cover,
            height: _screenSize.height,
            width: _screenSize.width,
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: _screenSize.height * 0.09),
            child: Text(
              "Recommendations for 'Vocabulary'",
              style: titulosR(_screenSize),
            ),
          ),
          Container(
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: _screenSize.height * 0.95,
                      width: _screenSize.width * 0.45,
                      padding: EdgeInsets.only(
                          top: _screenSize.height * 0.2, left: _screenSize.width * 0.02),
                      child: ListView(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 1.0),
                            child: Text(
                              '- Use memorization techniques.',
                              style: titulosEn(_screenSize),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: _screenSize.height * 0.035),
                            child: Text(
                              '- Learn a limited number of words each day.',
                              style: titulosEn(_screenSize),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: _screenSize.height * 0.035),
                            child: Text(
                              '- Learning the meaning of a term is easier and faster if we associate it with an image.',
                              style: titulosEn(_screenSize),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: _screenSize.height * 0.035),
                            child: Text(
                              '- Active reading will allow you to gradually incorporate new vocabulary.',
                              style: titulosEn(_screenSize),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: _screenSize.height * 0.95,
                      width: _screenSize.width * 0.50,
                      padding: EdgeInsets.only(
                          top: _screenSize.height * 0.2, left: _screenSize.width * 0.09),
                      child: ListView(
                        children: [
                          Text(
                            "You can also use cards like this: ",
                            style: titulosEn(_screenSize),
                          ),
                          Container(
                            width: _screenSize.width * 0.30,
                            height: _screenSize.height * 0.45,
                            padding: EdgeInsets.only(top: _screenSize.height * 0.05),
                            child: _cardExample(_screenSize),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardExample(var _screenSize) {
    return Card(
      elevation: 0.0,
      //margin: EdgeInsets.only(left: 32.0, right: 32.0, top: 5.0, bottom: 0.0),
      color: Color(0x00000000),

      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        onFlipDone: (status) {
          print(status);
        },
        front: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/imagenes_preguntas/gift.jpg",
                width: _screenSize.width * 0.12,
                fit: BoxFit.fill,
              ),
              Text('Touch here to flip back', style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
        ),
        back: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Gift', style: Theme.of(context).textTheme.headline1),
              Text('Touch here to flip front', style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
        ),
      ),
    );
  }
}
