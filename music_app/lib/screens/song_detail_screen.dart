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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          icon: Icon(Icons.keyboard_arrow_down_sharp),
          iconSize: 35,
          color: Theme.of(context).secondaryHeaderColor,
        ),
      ),
      body: Center(
        child: Text('Playing...'),
      ),
    );
  }
}
