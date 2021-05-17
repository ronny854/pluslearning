import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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

  get scoreTVocabulary {
    return _prefs.get('scoreTVocabulary' ?? 0);
  }

  set scoreTVocabulary(int value) {
    _prefs.setInt('scoreTVocabulary', value);
  }
}
