import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class SongDetailScreen extends StatelessWidget {
  static final String routeName = '/songdetail';
  const SongDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_down_sharp,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(children: [
          Text(
            "Song name",
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            height: 5,
          ),
          Text("Artist",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 19))
        ]),
      ),
    );
  }
}
