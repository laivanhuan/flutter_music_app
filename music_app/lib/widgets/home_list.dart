import 'package:flutter/material.dart';
import 'package:music_app/widgets/artist_list_item.dart';
import 'package:music_app/widgets/song_list_item.dart';

class HomeList extends StatelessWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      margin: EdgeInsets.symmetric(horizontal: 17, vertical: 17),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Artists you may like",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            height: 170,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(3, (index) {
                return ArtistListItem();
              }),
            ),
          ),
        ],
      ),
    );
  }
}
