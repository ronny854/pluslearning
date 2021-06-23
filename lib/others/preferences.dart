import 'package:learning_appfinal/others/constans.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _intance = new Preferences._internal();

  factory Preferences() {
    return _intance;
  }

  Preferences._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  get personajeSeleccionado {
    return _prefs.getString('personaje_select') ?? Personaje_1;
  }

  set personajeSeleccionado(String value) {
    _prefs.setString('personaje_select', value);
  }

  get iconPersonajeS {
    return _prefs.getString('icon_select') ?? IconP1;
  }

  set iconPersonajeS(String value) {
    _prefs.setString('icon_select', value);
  }

  get tutorialGame {
    return _prefs.getBool('tutorial') ?? true;
  }

  set tutorialGame(bool stateT) {
    _prefs.setBool('tutorial', stateT);
  }
}
