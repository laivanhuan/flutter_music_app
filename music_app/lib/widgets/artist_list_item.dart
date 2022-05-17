import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:music_app/screens/login_screen.dart';
import 'package:music_app/screens/song_detail_screen.dart';
import 'package:provider/provider.dart';

import '../providers/screen.dart';

class ArtistListItem extends StatelessWidget {
  const ArtistListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var link = 'https://thientu.vn/uploads/posts/2021/06/12/Cover-la-gi.jpeg';
    return InkWell(
      onTap: () {
        Provider.of<Screen>(context, listen: false).setCurrentScreen(5);
      },
      child: Column(
        children: [
          Container(
            height: 126,
            width: 126,
            margin: EdgeInsets.only(left: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                link,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              'Artist name',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
