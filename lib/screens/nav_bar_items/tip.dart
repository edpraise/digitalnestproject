import 'package:flutter/material.dart';
import 'package:tv24africa/pages/home_pageTabed.dart';
import 'package:url_launcher/url_launcher.dart';

class Tip extends StatefulWidget {
  @override
  _TipState createState() => _TipState();
}

class _TipState extends State<Tip> {
  List submitTipTopics = [
    {
      'imgUrl': 'assets/images/cr.jpg',
      'title': 'Citizens Reporter',
      'url': 'https://tv24africa.com/citizen-reporters/',
      'desc':
          'Please note that this platform is not for Press releases or Opinion Articles submission. It is strictly for citizens reporting.'
    },
    {
      'imgUrl': 'assets/images/iv.jpg',
      'title': 'Investigative Journalism',
      'url': 'https://news.tv24africa.com/investigative-journalists/',
      'desc':
          'To provide information regarding your investigative story or news tip,  please click below',
    },
    {
      'imgUrl': 'assets/images/tc.jpg',
      'title': 'Tv Content Provider',
      'url': 'https://news.tv24africa.com/investigative-journalists/',
      'desc':
          'To provide information regarding your programme or content ideas, please click below'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF1a1a1a),
        appBar: AppBar(
          backgroundColor: Color(0xFFcc0000),
          title: Text("Submit Your Tip"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Icon(Icons.home, color: Colors.white)),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
              itemCount: submitTipTopics.length,
              itemBuilder: (BuildContext context, int index) {
                return TipSubmission(
                  title: submitTipTopics[index]['title'],
                  imgUrl: submitTipTopics[index]['imgUrl'],
                  desc: submitTipTopics[index]['desc'],
                  onPressed: () {
                    _launchURL(submitTipTopics[index]['url']);
                  },
                );
              }),
        )
        );
  }
}

// ignore: must_be_immutable
class TipSubmission extends StatelessWidget {
  Function onPressed;
  String title;
  String imgUrl;
  String desc;
  TipSubmission({this.desc, this.imgUrl, this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 10,
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          color: Colors.redAccent[700],
        ),
        Text(title, style: TextStyle(color: Colors.white, fontSize: 15)),
        Card(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Image.asset(imgUrl,
                    fit: BoxFit.cover, height: 100, width: 100),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[Text(desc)],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              height: 35,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.redAccent[700],
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: GestureDetector(
                  onTap: onPressed,
                  child: Text(
                    'Click Here',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ))),
        )
      ],
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
