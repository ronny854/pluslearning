import 'package:flutter/material.dart';
import 'package:flutter/services.Dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:learning_appfinal/others/preferences.dart';
import 'package:learning_appfinal/others/routes.dart' as route;
import 'package:learning_appfinal/providers/options_provider.dart';
import 'package:learning_appfinal/providers/questions_provider.dart';
import 'package:learning_appfinal/providers/topics_provider.dart';
import 'package:learning_appfinal/views/intro.dart';
import 'package:provider/provider.dart';

void main() {
/*   final prefs = new Preferences();
  await prefs.initPrefs(); */
  WidgetsFlutterBinding.ensureInitialized();
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
      ],
      child: MaterialApp(
        initialRoute: '/',
        onGenerateRoute: route.generateRoute,
        home: Intro(),
      ),
    );
  }
}
