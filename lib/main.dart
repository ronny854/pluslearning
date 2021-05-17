import 'package:flutter/material.dart';
import 'package:flutter/services.Dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:learning_appfinal/others/preferences.dart';
import 'package:learning_appfinal/others/routes.dart' as route;
import 'package:learning_appfinal/views/intro.dart';

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
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: route.generateRoute,
      home: Intro(),
    );
  }
}
