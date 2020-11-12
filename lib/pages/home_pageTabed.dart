import 'package:flutter/material.dart';
import 'package:tv24africa/PodcastPages/podcast_homePage.dart';
import 'package:tv24africa/screens/live_tv.dart';
import 'package:tv24africa/screens/main_drawe.dart';
import 'package:tv24africa/screens/news.dart';  
import 'package:tv24africa/screens/settinng.dart';
import 'package:tv24africa/screens/videos.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFbd1017),
          title: Image.asset('assets/images/tony.png', fit: BoxFit.cover,height: 50,),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                 Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SettingsScreen()));
              },
            )
          ],
          bottom: TabBar(
            indicatorColor: Colors.black,
            tabs: <Widget>[
            Tab(
              text: "Live TV",
            ),
            Tab(
              text: "News",
            ),
            Tab(
              text: "Videos",
            ),
            Tab(
              text: "Podcasts",
            ),
          ]),
          centerTitle: true,
          elevation: 0.0,
        ),

        drawer: MainDrawer(),
        body: TabBarView(children: [LiveVideo(), News(), Videos(),PodCastHomePage ()]),
      ),
    );
  }
}
