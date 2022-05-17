import 'package:flutter/material.dart';
import 'package:music_app/widgets/song_list_item.dart';

class HomeSongGrid extends StatelessWidget {
  const HomeSongGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 17),
      child: SafeArea(
        child: Column(children: [
          Container(
              margin: EdgeInsets.only(bottom: 17),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Songs you may like",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
              )),
          Container(
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: 2 / 3,
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 10,
              mainAxisSpacing: 30,
              children: List.generate(10, (index) {
                return Column(
                  children: [
                    Expanded(child: SongListItem()),
                  ],
                );
              }),
            ),
          ),
          SizedBox(
            height: 50,
          )
        ]),
      ),
    );
  }
}
