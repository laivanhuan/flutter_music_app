import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Screen with ChangeNotifier {
  int _currentScreen = 0;
  String _genreName = "";
  String _artistName = "";

  int get currentScreen => this._currentScreen;
  String get genreName => this._genreName;
  String get artistName => this._artistName;

  void setCurrentScreen(int set, [String genre = "", String artist = ""]) {
    _currentScreen = set;
    _genreName = genre;
    _artistName = artist;
    notifyListeners();
  }
}
