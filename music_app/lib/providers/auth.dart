import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String? _token = null;

  int? _userId;
  late String _userName;
  String? _userEmail;

  bool get isAuth {
    return _token != null;
  }

  String get userName => _userName;

  String get userEmail => _userEmail!;

  int get userId => _userId!;

  Future<void> login(String username, String password) async {
    try {
      final url = Uri.parse("https://conkhunglongnene.site/auth/login");
      final urlInfo = Uri.parse("https://conkhunglongnene.site/user");

      final response = await http
          .post(url, body: {'username': username, 'password': password});
      final responseData = jsonDecode(response.body);

      if (responseData['message'] == "Error") {
        print("Username or password is not correct");
        return;
      }
      _token = responseData["access_token"];

      final userInfoRes = await http.get(urlInfo, headers: {
        'Authorization': 'Bearer ' + _token!,
      });

      final userResData = json.decode(userInfoRes.body);
      print(userResData);
      _userId = userResData['data']["id"];
      _userName = userResData['data']["name"];
      _userEmail = userResData['data']["email"];
      print(_userId);
      print(_userEmail);
      print(_userName);
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode({
        'token': _token,
        'id': _userId,
        'name': _userName,
        'email': _userEmail
      });
      prefs.setString('userData', userData);
    } catch (err) {
      throw err;
    }
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedUserData = json.decode(prefs.getString('userData') as String)
        as Map<String, Object>;
    _token = extractedUserData['token'] as String;
    _userId = extractedUserData['id'] as int;
    _userName = extractedUserData['name'] as String;
    _userEmail = extractedUserData['email'] as String;
    notifyListeners();
    return true;
  }

  Future<void> signup(String username, String name, String password,
      String email, BuildContext context) async {
    try {
      final url = Uri.parse("https://conkhunglongnene.site/auth/register");
      final response = await http.post(url, body: {
        'username': username,
        'name': name,
        'password': password,
        'email': email
      });
      final responseData = json.decode(response.body);
      print(responseData);
      if (responseData['message'] == 'OK! User created.') {
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Login now!'),
                  content: Text('Your account has been created!'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Okay'),
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                    )
                  ],
                ));
      }
    } catch (err) {
      throw err;
    }
  }

  Future<void> logout() async {
    _token = null;
    _userId = null;
    _userEmail = "";
    _userName = "";
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
