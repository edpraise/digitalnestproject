import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:tv24africa/pages/home_pageTabed.dart';
import 'package:tv24africa/screens/landing_page.dart';
// import 'package:tv24africa/services/player_provider.dart';

// import 'package:tv24africa/screens/podcast%20Section/podcastlist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home:SplashScreen(),
        // home: PodcastList(),
      );
  }
}
