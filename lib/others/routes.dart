import 'package:flutter/material.dart';
import 'package:learning_appfinal/views/achievements.dart';
import 'package:learning_appfinal/views/game.dart';
import 'package:learning_appfinal/views/menu.dart';
import 'package:learning_appfinal/views/profile.dart';
import 'package:learning_appfinal/views/score.dart';
import 'package:learning_appfinal/views/settings.dart';
import 'package:learning_appfinal/views/topics.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => Menu());
    case 'juego':
      return MaterialPageRoute(builder: (context) => Game());
    case 'perfil':
      return MaterialPageRoute(builder: (context) => Profile());
    case 'conf':
      return MaterialPageRoute(builder: (context) => Settings());
    case 'logros':
      return MaterialPageRoute(builder: (context) => Achievements());
    case 'temas':
      return MaterialPageRoute(builder: (context) => Topics());
    case 'score':
      return MaterialPageRoute(builder: (context) => Score());
    default:
  }
}
