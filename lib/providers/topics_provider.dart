import 'package:flutter/material.dart';
import 'package:learning_appfinal/models/topics_model.dart';

class TopicsProvider extends ChangeNotifier {
  List<Topic> topics = [];

  cargarTemas() async {
    final topic = await TopicModel().getTopics2();
    this.topics = [...topic];
    notifyListeners();
  }
}
