import 'package:flutter/material.dart';
import 'package:music_app/widgets/song_list_item.dart';

class SongGrid extends StatelessWidget {
  const SongGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: GridView.count(
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
    );
  }
}
