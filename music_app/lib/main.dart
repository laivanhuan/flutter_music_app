import 'package:flutter/material.dart';
import 'package:music_app/providers/screen.dart';
import 'package:music_app/screens/home_screen.dart';
import 'package:music_app/screens/login_screen.dart';
import 'package:music_app/screens/song_detail_screen.dart';
import 'package:music_app/screens/songs_list.dart';
import 'package:music_app/screens/tab_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Screen()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color.fromARGB(255, 196, 196, 196),
          accentColor: Color.fromRGBO(75, 75, 75, 1),
          secondaryHeaderColor: Color(0xffc4c4c4),
          scaffoldBackgroundColor: Color.fromRGBO(247, 247, 247, 1),
        ),
        home: TabScreen(),
        routes: {
          '/songdetail': (context) => SongDetailScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/songlist') {
            final value = settings.arguments as String;
            return MaterialPageRoute(builder: (_) => SongLists(value));
          }
        },
      ),
    );
  }
}
