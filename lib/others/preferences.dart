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
}
