import 'package:flutter/material.dart';

class HomeSreen extends StatelessWidget {
  const HomeSreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: Text('Home'),
      ),
    );
  }
}
