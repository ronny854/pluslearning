import 'package:flutter/material.dart';
import 'package:flutter/services.Dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:learning_appfinal/others/preferences.dart';
import 'package:learning_appfinal/others/routes.dart' as route;
import 'package:learning_appfinal/providers/options_provider.dart';
import 'package:learning_appfinal/providers/points_provider.dart';
import 'package:learning_appfinal/providers/questions_provider.dart';
import 'package:learning_appfinal/providers/topics_provider.dart';
import 'package:learning_appfinal/views/intro.dart';
//import 'package:learning_appfinal/views/menu.dart';
import 'package:provider/provider.dart';

import 'others/preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new Preferences();
  await prefs.initPrefs();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new TopicsProvider()),
        ChangeNotifierProvider(create: (_) => new QuestionsProvider()),
        ChangeNotifierProvider(create: (_) => new OptionsProvider()),
        ChangeNotifierProvider(create: (_) => new PointsProvider()),
      ],
      child: MaterialApp(
        initialRoute: '/',
        onGenerateRoute: route.generateRoute,
        home: Intro(),
      ),
    );
  }
}
