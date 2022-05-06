import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:music_app/screens/login_screen.dart';
import 'package:music_app/screens/song_detail_screen.dart';

class SongListItem extends StatelessWidget {
  const SongListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var link = 'https://thientu.vn/uploads/posts/2021/06/12/Cover-la-gi.jpeg';
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SongDetailScreen.routeName);
      },
      child: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            child: ClipRRect(
              child: Image.network(
                link,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Song name',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                'Artist',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
