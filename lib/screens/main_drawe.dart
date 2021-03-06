import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tv24africa/pages/home_pageTabed.dart';
import 'package:tv24africa/screens/i_report.dart';
// import 'package:tv24africa/screens/live_tv.dart';
import 'package:tv24africa/screens/nav_bar_items/about_us.dart';
import 'package:tv24africa/screens/nav_bar_items/contact.dart';
// import 'package:tv24africa/screens/nav_bar_items/home.dart';
import 'package:tv24africa/screens/nav_bar_items/tip.dart';
import 'package:tv24africa/screens/nav_bar_items/weblive_tv.dart';
import 'package:tv24africa/screens/nav_bar_items/webnewPaper.dart';
import 'package:tv24africa/screens/programs.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Color(0xFFbd1017),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(top: 50),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/images/td.gif'),
                              fit: BoxFit.contain)),
                    )
                  ],
                ),
              ),
            ),
            Container(
                decoration: BoxDecoration(color: Color(0xFF333333)),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage()));
                  },
                  leading: IconButton(
                      color: Colors.white,
                      icon: FaIcon(
                        FontAwesomeIcons.home,
                      ),
                      onPressed: () {}),
                  title: Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )),
            Container(
                decoration: BoxDecoration(color: Color(0xFF333333)),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LiveTv()));
                  },
                  leading: IconButton(
                      color: Colors.white,
                      icon: FaIcon(
                        FontAwesomeIcons.tv,
                      ),
                      onPressed: () {}),
                  title: Text(
                    'Live TV website ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )),
            Container(
                decoration: BoxDecoration(color: Color(0xFF333333)),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NewsPaperSite()));
                  },
                  leading: IconButton(
                      color: Colors.white,
                      icon: FaIcon(
                        FontAwesomeIcons.newspaper,
                      ),
                      onPressed: () {}),
                  title: Text(
                    'Newspaper Website',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )),
                 Container(
                decoration: BoxDecoration(color: Color(0xFF333333)),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => IReport()));
                  },
                  leading: IconButton(
                      color: Colors.white,
                      icon: FaIcon(
                        FontAwesomeIcons.envelopeOpenText,
                      ),
                      onPressed: () {}),
                  title: Text(
                    'i-Report ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )),
                Container(
                decoration: BoxDecoration(color: Color(0xFF333333)),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Tip()));
                  },
                  leading: IconButton(
                      color: Colors.white,
                      icon: FaIcon(
                        FontAwesomeIcons.signature,
                      ),
                      onPressed: () {}),
                  title: Text(
                    'Submit a Pitch ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )),
                   Container(
                decoration: BoxDecoration(color: Color(0xFF333333)),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Programs()));
                  },
                  leading: IconButton(
                      color: Colors.white,
                      icon: FaIcon(
                        FontAwesomeIcons.ad,
                      ),
                      onPressed: () {}),
                  title: Text(
                    'Programs ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )),
            Container(
                decoration: BoxDecoration(color: Color(0xFF333333)),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => About()));
                  },
                  leading: IconButton(
                      color: Colors.white,
                      icon: FaIcon(
                        FontAwesomeIcons.info,
                      ),
                      onPressed: () {}),
                  title: Text(
                    'About Us',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )),
            Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(color: Color(0xFF333333)),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ContactUs()));
                  },
                  leading: IconButton(
                      color: Colors.white,
                      icon: FaIcon(
                        FontAwesomeIcons.contao,
                      ),
                      onPressed: () {}),
                  title: Text(
                    'Contact Us',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
