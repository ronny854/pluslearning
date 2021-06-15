import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:learning_appfinal/logic/envioPreguntas.dart';
import 'package:learning_appfinal/others/constans.dart';
import 'package:learning_appfinal/providers/topics_provider.dart';
import 'package:provider/provider.dart';
//import 'package:learning_appfinal/others/state_manager.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';

class Topics extends StatefulWidget {
  Topics({Key key}) : super(key: key);

  @override
  _TopicsState createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  @override
  Widget build(BuildContext context) {
    final topicsProvider = Provider.of<TopicsProvider>(context);
    final topicP = topicsProvider.topics;

    var _screenSize = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              FondoTemas,
              fit: BoxFit.cover,
              height: _screenSize.height,
              width: _screenSize.width,
            ),
            Center(
              child: Container(
                child: Swiper(
                  itemBuilder: (_, int i) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ePreguntas(
                            idTemaPregunta: topicP[i].id,
                            score: topicP[i].scoreT,
                          );
                        }));
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            BotonTopic,
                            width: _screenSize.width,
                            height: _screenSize.height * 0.55,
                          ),
                          Container(
                            //padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                            child: Text(
                              topicP[i].name,
                              style: GoogleFonts.pacifico(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 60.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: 4,
                  viewportFraction: 0.7,
                  scale: 0.8,
                  //pagination: new SwiperPagination(),
                  //control: new SwiperControl(),
                ),
              ),
            ),
/*             ListView.builder(
              padding: EdgeInsets.only(top: 25.0, bottom: 40.0),
              itemCount: topicP.length,
              itemBuilder: (_, int i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ePreguntas(
                        idTemaPregunta: topicP[i].id,
                        score: topicP[i].scoreT,
                      );
                    }));
                  },
                  child: Container(),

                );
              },
            ), */
          ],
        ),
      ),
    );
  }

/*                   child: Stack(
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
                        child: Text(topicP[i].name),
                      ),
                      SizedBox(
                        height: 70.0,
                      ), 
                    ],
                  ), */
/*   Widget topicsMenu() {
    return Container(
      padding: EdgeInsets.only(top: 25.0, bottom: 40.0),
      child: FutureBuilder<List<Topic>>(
        future: getTopics(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError)
            return Center(
              child: Text('${snapshot.error}'),
            );
          else if (snapshot.hasData) {
            return ListView(
              children: snapshot.data.map<Widget>((topic) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //print(topic.id);
                      return ePreguntas(
                        idTemaPregunta: topic.id,
                      );
                    }));
                  },
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
                        child: Text('${topic.name}'),
                      ),
                      SizedBox(
                        height: 70.0,
                      )
                    ],
                  ),
                );
              }).toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  } */

/*   Future<List<Topic>> getTopics() async {
    var result = await TopicModel().getTopics();
    var res2 = await TopicModel().getTopics2();
    print(res2[0].scoreT);

    //context.read(topicListProvider).state = result;
    return result;
  } */
}
