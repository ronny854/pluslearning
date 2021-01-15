import 'package:flutter/material.dart';
import 'package:learning_appfinal/conexion/db_helper.dart';
import 'package:learning_appfinal/providers/options_provider.dart';

class optionsW extends StatelessWidget {
  optionsW({Key key, this.idQ, this.context}) : super(key: key);

  BuildContext context;
  int idQ;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getOptionQuestion(idQ),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return optionWidget(context, snapshot);
      },
    );
  }

  Future<List<Option>> getOptionQuestion(int id) async {
    var db = await copyDB();
    var result = await OptionProvider().getOptionQuestionById(db, id);
/*     listaOP = result;
    print(listaOP); */
    return result;
  }

  Widget optionWidget(BuildContext context, AsyncSnapshot snapshot) {
    var values = snapshot.data;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: values == null ? 0 : values.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          child: MaterialButton(
            //onPressed: () => checkanswer(k),
            onPressed: () => null,
            child: Text(
              //mydata[2][i.toString()][k],
              values[index].textO,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Alike",
                fontSize: 16.0,
              ),
              maxLines: 1,
            ),
            color: Colors.indigo,
            minWidth: 200.0,
            height: 45.0,
          ),
        );
      },
    );
  }
}
