import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Screen with ChangeNotifier {
  int _currentScreen = 0;
  String _genreName = "";

  int get currentScreen => this._currentScreen;
  String get genreName => this._genreName;

  void setCurrentScreen(int set, [String genre = ""]) {
    _currentScreen = set;
    _genreName = genre;
    notifyListeners();
  }
}
