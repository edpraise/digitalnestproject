import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:tv24africa/screens/termsofuse.dart';
import 'package:tv24africa/widgets/ratingdialog.dart';


class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String link = 'https://tv24africa.com/';
  
  Future<void> share(dynamic link, String title) async {
    await FlutterShare.share(
        title: 'Tv24 Africa',
        text: title,
        linkUrl: link,
        chooserTitle: 'Share Tv24app with friends?');
  }

  bool isSwitched1 = false;
  bool isSwitched = false;
  List<Color> _colors = [Color(0xFFcc0000), Colors.black];
  List<double> _stops = [0.0, 0.7];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFcc0000),
        title: Text('Settings', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Divider(),
                Container(
                    child: ListTile(
                  title: Text("Stream Quality"),
                  leading: Container(
                    height: 60,
                    width: 70,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: _colors,
                        stops: _stops,
                      ),
                      // color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.view_stream, color: Colors.white),
                  ),
                  trailing: GestureDetector(
                      onTap: () {
                        // StreamSlider();
                        _streamQuality();
                      },
                      child: Icon(Icons.arrow_forward_ios)),
                )),
                Divider(),
                Container(
                    child: ListTile(
                  title: Text(' Push Notifications'),
                  leading: Container(
                    height: 60,
                    width: 70,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: _colors,
                        stops: _stops,
                      ),
                      // color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.refresh_rounded,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                        print(isSwitched);
                      });
                    },
                    activeTrackColor: Colors.black,
                    activeColor: Colors.redAccent[700],
                  ),
                )),
                Divider(),
                Container(
                    child: ListTile(
                  title: Text('Background App Refresh'),
                  leading: Container(
                    height: 60,
                    width: 70,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: _colors,
                        stops: _stops,
                      ),
                      // color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Switch(
                    value: isSwitched1,
                    onChanged: (value) {
                      setState(() {
                        isSwitched1 = value;
                        print(isSwitched1);
                      });
                    },
                    activeTrackColor: Colors.black,
                    activeColor: Colors.redAccent[700],
                  ),
                )),
                SizedBox(
                  height: 35,
                ),

                Divider(),
                Container(
                    child: ListTile(
                  title: Text('Terms of use'),
                  trailing: GestureDetector(
                      onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TermsOfUse()));
                      },
                      child: Icon(Icons.arrow_forward_ios)),
                  leading: Container(
                    height: 60,
                    width: 70,
                    decoration: BoxDecoration(
                      // color: Colors.black,
                      gradient: LinearGradient(
                        colors: _colors,
                        stops: _stops,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.list, color: Colors.white),
                  ),
                )),
                Divider(),
                Container(
                    child: ListTile(
                  title: Text('Rate this App'),
                  trailing: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RatingsModule()));
                    },
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                  leading: Container(
                    height: 60,
                    width: 70,
                    decoration: BoxDecoration(
                      // color: Colors.black,
                      gradient: LinearGradient(
                        colors: _colors,
                        stops: _stops,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                  ),
                )),
                Divider(),
                Container(
                    child: ListTile(
                  title: Text('Share this app'),
                  trailing: GestureDetector(
                      onTap: () {
                        share(link, 'text');
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                      )),
                  leading: Container(
                      height: 60,
                      width: 70,
                      decoration: BoxDecoration(
                        // color: Colors.black,
                        gradient: LinearGradient(
                          colors: _colors,
                          stops: _stops,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.share_outlined, color: Colors.white)),
                )),
                Divider(),
             
              ],
            ),
          ),
        ),
      ),
    );
  }
   
  _streamQuality() {
    showDialog(
        context: context,
        builder: (_) => new CupertinoAlertDialog(
              title: new Text("Stream Quality"),
              content: new Text(
                  "The stream Quality will be set in accordance to your current internet bandwith"),
              actions: <Widget>[
                FlatButton(
                  child: Text('Close me!'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }
}
