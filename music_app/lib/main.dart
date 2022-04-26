import 'package:flutter/material.dart';
import 'package:music_app/screens/home_screen.dart';
import 'package:music_app/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(247, 247, 247, 1),
          accentColor: Color.fromRGBO(75, 75, 75, 1)),
      home: const LoginScreen(),
    );
  }
}
