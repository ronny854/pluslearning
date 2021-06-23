import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:learning_appfinal/others/constans.dart';
import 'package:learning_appfinal/others/preferences.dart';
import 'package:learning_appfinal/views/topics.dart';

class Tutorial extends StatefulWidget {
  Tutorial({Key key}) : super(key: key);

  @override
  _TutorialState createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  final _prefs = new Preferences();
  final _pages = [
    //1
    PageViewModel(
      pageColor: const Color(0xFF03A9F4),
      // iconImageAssetPath: 'assets/air-hostess.png',
      //bubble: Image.asset(IconPers,
      body: const Text(
        'A new way to learn English in an easy and fun way.',
      ),
      title: const Text(
        'Welcome to',
      ),
      titleTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      mainImage: Image.asset(
        IconPers,
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
    ),
    //2
    PageViewModel(
      pageColor: const Color(0xFF03A9F4),
      // iconImageAssetPath: 'assets/air-hostess.png',
      //bubble: Image.asset(IconPers,,
      body: Container(
        child: const Text(
          'Defeat enemies by responding correctly to questions raised at the set time, correct response is an attack from you and an incorrect response an attack from the enemy.',
        ),
      ),
      title: const Text(
        'How to play?',
      ),
      titleTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      mainImage: Container(
        height: 200.0,
        width: 285.0,
        child: FlareActor(
          Atutorial,
          animation: 'screen1',
          fit: BoxFit.fill,
        ),
      ),
    ),
    PageViewModel(
      pageColor: const Color(0xFF8BC34A),
      //iconImageAssetPath: 'assets/waiter.png',
      body: const Text(
        'Also if you do not respond in the established time the enemy will attack you.',
      ),
      title: const Text('How to play?'),
      mainImage: Container(
        height: 200.0,
        width: 285.0,
        child: FlareActor(
          Atutorial,
          animation: 'screen2',
          fit: BoxFit.fill,
        ),
      ),
      titleTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
    //4
    PageViewModel(
      pageColor: const Color(0xFF8BC34A),
      //iconImageAssetPath: 'assets/waiter.png',
      body: const Text(
        'Remember, swipe your finger down the bottom of the screen to see all the options available for the question.',
      ),
      title: const Text('How to play?'),
      mainImage: Container(
        height: 200.0,
        width: 285.0,
        child: FlareActor(
          Atutorial,
          animation: 'screen3',
          fit: BoxFit.fill,
        ),
      ),
      titleTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
    //5
    PageViewModel(
      pageColor: const Color(0xFF03A9F4),
      // iconImageAssetPath: 'assets/air-hostess.png',
      //bubble: Image.asset(IconPers,,
      body: const Text(
        'Collect points to unlock characters, you can select them in the characters part.',
      ),
      title: const Text(
        'Characters',
      ),
      titleTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      mainImage: Image.asset(
        IconPers,
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
    ),
    //6
    PageViewModel(
      pageColor: const Color(0xFF8BC34A),
      //iconImageAssetPath: 'assets/waiter.png',
      body: const Text(
        'Profile You can review your performance of each topic in the profile section, when your performance is less than 30%, a recommendation button will appear.',
      ),
      title: const Text('Profile'),
      mainImage: Image.asset(
        IconPers,
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),

    PageViewModel(
      pageBackground: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [0.0, 1.0],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            tileMode: TileMode.repeated,
            colors: [
              Colors.orange,
              Colors.pinkAccent,
            ],
          ),
        ),
      ),
      //iconImageAssetPath: 'assets/taxi-driver.png',
      body: const Text(
        'Select a game mode and start your first to calibrate your level.',
      ),
      title: const Text("let's go!"),
      mainImage: Image.asset(
        IconPers,
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return IntroViewsFlutter(
      _pages,
      showNextButton: true,
      showBackButton: true,
      onTapDoneButton: () {
        setState(() {
          _prefs.tutorialGame = false;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Topics()),
        );
      },
    );
  }
}
