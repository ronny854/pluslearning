import 'package:flutter/material.dart';
import 'package:learning_appfinal/conexion/db_helper.dart';
import 'package:learning_appfinal/logic/envioPreguntas.dart';
import 'package:learning_appfinal/others/constans.dart';
import 'package:learning_appfinal/others/state_manager.dart';
import 'package:learning_appfinal/providers/topics_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Topics extends StatefulWidget {
  Topics({Key key}) : super(key: key);

  @override
  _TopicsState createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            FondoTemas,
            fit: BoxFit.cover,
            height: media.height,
            width: media.width,
          ),
          Container(
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
                          context.read(questionTopicState).state = topic;
/*                           Navigator.pushNamed(context, 'juego',
                              arguments: topic.id); */
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            //print(topic.id);
                            return ePreguntas(
                              idTemaPregunta: topic.id,
                            );
                          }));
                          /* return Game(
                            idquestionTopic: topic.id,
                          ); */
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
          ),
        ],
      ),
    );
  }

  Future<List<Topic>> getTopics() async {
    var db = await copyDB();
    var result = await TopicProvider().getTopics(db);
    context.read(topicListProvider).state = result;
    return result;
  }
}
