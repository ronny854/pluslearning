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

  get personaje1B {
    return _prefs.getBool('personaje1') ?? true;
  }

  set personaje1B(bool stateT) {
    _prefs.setBool('personaje1', stateT);
  }

  get personaje2B {
    return _prefs.getBool('personaje2') ?? true;
  }

  set personaje2B(bool stateT) {
    _prefs.setBool('personaje2', stateT);
  }

  get personaje3B {
    return _prefs.getBool('personaje3') ?? true;
  }

  set personaje3B(bool stateT) {
    _prefs.setBool('personaje3', stateT);
  }

////// preferencias calibracion
  get calibrateGrammar {
    return _prefs.getBool('calibrateG') ?? false;
  }

  set calibrateGrammar(bool stateT) {
    _prefs.setBool('calibrateG', stateT);
  }

  get calibrateReading {
    return _prefs.getBool('calibrateR') ?? false;
  }

  set calibrateReading(bool stateT) {
    _prefs.setBool('calibrateR', stateT);
  }

  get calibrateListening {
    return _prefs.getBool('calibrateL') ?? false;
  }

  set calibrateListening(bool stateT) {
    _prefs.setBool('calibrateL', stateT);
  }

  get calibrateVocabulary {
    return _prefs.getBool('calibrateV') ?? false;
  }

  set calibrateVocabulary(bool stateT) {
    _prefs.setBool('calibrateV', stateT);
  }

  get isCalibrating {
    return _prefs.getBool('calibrate') ?? true;
  }

  set isCalibrating(bool stateT) {
    _prefs.setBool('calibrate', stateT);
  }

  // notificaciones de recomendaciones

  get countG {
    return _prefs.getInt('countGrammar') ?? 0;
  }

  set countG(int count) {
    _prefs.setInt('countGrammar', count);
  }

  get countR {
    return _prefs.getInt('countReading') ?? 0;
  }

  set countR(int count) {
    _prefs.setInt('countReading', count);
  }

  get countL {
    return _prefs.getInt('countListening') ?? 0;
  }

  set countL(int count) {
    _prefs.setInt('countListening', count);
  }

  get countV {
    return _prefs.getInt('countVocabulary') ?? 0;
  }

  set countV(int count) {
    _prefs.setInt('countVocabulary', count);
  }

  get notificationG {
    return _prefs.getBool('notificationGrammar') ?? false;
  }

  set notificationG(bool notification) {
    _prefs.setBool('notificationGrammar', notification);
  }

  get notificationR {
    return _prefs.getBool('notificationReading') ?? false;
  }

  set notificationR(bool notification) {
    _prefs.setBool('notificationReading', notification);
  }

  get notificationL {
    return _prefs.getBool('notificationListening') ?? false;
  }

  set notificationL(bool notification) {
    _prefs.setBool('notificationListening', notification);
  }

  get notificationV {
    return _prefs.getBool('notificationVocabulary') ?? false;
  }

  set notificationV(bool notification) {
    _prefs.setBool('notificationVocabulary', notification);
  }
}
