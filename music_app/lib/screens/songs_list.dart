import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:music_app/widgets/song_list_item.dart';
import 'package:provider/provider.dart';

import '../providers/screen.dart';

class SongLists extends StatelessWidget {
  static final String routeName = '/songlist';
  final String genre;
  SongLists(this.genre);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // Navigator.pop(context, false);
            Provider.of<Screen>(context, listen: false).setCurrentScreen(0);
          },
          icon: Icon(
            Icons.keyboard_arrow_down_sharp,
            color: Theme.of(context).secondaryHeaderColor,
          ),
          iconSize: 35,
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(children: [
          Container(
              margin: EdgeInsets.only(left: 10, bottom: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  genre,
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                ),
              )),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: GridView.count(
                childAspectRatio: 2 / 3,
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 30,
                children: List.generate(10, (index) {
                  return SongListItem();
                }),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
