import 'package:flutter/material.dart';
import 'package:tv24africa/PodcastPages/podcastPage.dart';
import 'package:tv24africa/utilities/hex_color.dart';

import 'favorite_podcastPage.dart';

class PodCastHomePage extends StatefulWidget {
  @override
  _PodCastHomePageState createState() => _PodCastHomePageState();
}

class _PodCastHomePageState extends State<PodCastHomePage> {
   int _currentIndex = 0;
  final List<Widget> _childern = [
    new RadioPage(isFavouriteOnly: false),
    FavRadiosPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: Scaffold(
        body: _childern[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor:Color(0xFFbd1017),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: HexColor("FF0000"),
          unselectedItemColor: Colors.black,
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          items: [
            _bottomNavItem(Icons.play_arrow, "Listen"),
            _bottomNavItem(Icons.favorite, "Favorite")
          ],
          onTap: onTabTapped,
        ),
      ),
    );
  }

  _bottomNavItem(IconData icon, String title) {
    return BottomNavigationBarItem(
      icon: new Icon(
        icon,
        color: Colors.black,
      ),
      activeIcon: new Icon(
        icon,
        color: HexColor("#ffffff"),
      ),
      title: new Text(
        title,
        style: TextStyle(
          color: HexColor("#ffffff"),
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    // Error : setState method called after dispose()?
    if (!mounted) return;
    setState(() {
      _currentIndex = index;
    });
  }
}