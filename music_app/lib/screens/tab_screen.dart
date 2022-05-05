import 'package:flutter/material.dart';
import 'package:music_app/screens/home_screen.dart';
import 'package:music_app/widgets/login_form.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': HomeSreen(),
        'title': 'Home',
      },
      {
        'page': Center(
          child: Text('abc'),
        ),
        'title': 'Your Favorite',
      },
      {
        'page': LoginForm(),
        'title': 'Home',
      },
      {
        'page': Center(
          child: Text('abc'),
        ),
        'title': 'Your Favorite',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomSheet: true
          ? Container(
              height: 70,
              width: double.infinity,
              margin: EdgeInsets.only(right: 5, left: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0), color: Colors.pink),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8)),
                    child: Image.network(
                      'https://i.pinimg.com/736x/fe/71/10/fe711033077aa00d714c6475c18f0565.jpg',
                      width: 72,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Column(
                    children: [Text('Song name'), Text('Artist')],
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.play_arrow))
                ],
              ),
            )
          : null,
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
          child: BottomNavigationBar(
            iconSize: 40,
            onTap: _selectPage,
            unselectedItemColor: Theme.of(context).accentColor,
            selectedItemColor: Colors.black,
            currentIndex: _selectedPageIndex,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.library_music),
                label: 'Your Library',
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.account_circle_outlined),
                label: 'Account',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
