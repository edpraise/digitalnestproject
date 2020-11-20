import 'package:flutter/material.dart';
import 'package:tv24africa/pages/home_pageTabed.dart';
import 'package:url_launcher/url_launcher.dart';

class Programs extends StatefulWidget {
  @override
  _ProgramsState createState() => _ProgramsState();
}

class _ProgramsState extends State<Programs> {
  List programlist = [
    {
      'imgUrl':
          'https://tv24africa.com/wp-content/uploads/2020/07/THIS-IS-AFRICA-..jpg',
      'title': 'This is Africa',
      'url': 'https://tv24africa.com/category/videos/this-is-africa/',
      'desc':
          'This Is Africa is the flagship programme of TV24 Africa which is designed to provide in-depth report and analysis of developmental issues in the African continent.'
    },
    {
      'imgUrl':
          'https://tv24africa.com/wp-content/uploads/2020/07/the-investigation.jpg',
      'title': 'The Investigation',
      'url': 'https://tv24africa.com/category/videos/the-investigation/',
      'desc':
          'The investigation is TV24 Africa’s public interest program that uncovers secrets and reveals truths that are hidden from the public, especially regarding wrongdoings, corruption, injustice and abuse of power.',
    },
    {
      'imgUrl':
          'https://tv24africa.com/wp-content/uploads/2020/07/TV-24-AFRICAN-NEWS.jpg',
      'title': 'Tv24 Africa News',
      'url': 'https://tv24africa.com/category/tv24africanews/',
      'desc':
          'This is the Daily Prime News Broadcast on TV24Africa covering major events in politics, governance, business, sports and happenings within and outside the African continent.'
    },
    {
      'imgUrl':
          'https://tv24africa.com/wp-content/uploads/2020/07/DATBREAK-AFRICAN-1-1.jpg',
      'title': 'Day Break Africa',
      'url': 'https://tv24africa.com/category/videos/day-break-africa/',
      'desc':
          'Day Break Africa is an interactive live daily morning breakfast show that offers expert analysis on topical issues ranging from politics, business, entertainment, sports and many more issues around Sub-Saharan Africa.'
    },
    {
      'imgUrl': 'https://tv24africa.com/wp-content/uploads/2020/07/tv24.jpg',
      'title': 'Tv24 Africa Interview',
      'url': 'https://tv24africa.com/category/videos/tv24-africa-interview/',
      'desc':
          'A special programme that hosts leading figures in politics, business, entertainment and other relevant areas to share their perspectives on any selected issue.'
    },
    {
      'imgUrl':
          'https://tv24africa.com/wp-content/uploads/2020/07/AFRICA-THIS-WEEK.jpg',
      'title': 'Africa this week',
      'url': 'https://news.tv24africa.com/investigative-journalists/',
      'desc': ''''
Africa This Week is a round up of major headlines of news and activities within the Africa continent for the week in review.'''
          ''
    },
    {
      'imgUrl':
          'https://tv24africa.com/wp-content/uploads/2020/07/THE-CHANGE-MAKER.jpg',
      'title': 'The Change Makers',
      'url': 'https://tv24africa.com/category/the-change-makers/',
      'desc':
          'The change makers is a major highlights of Africa’s most dazzling trendsetters who carve a niche for themselves and use that to create changes for their communities, be it in art, travel, music, technology, architecture and fashion.'
    },
    {
      'imgUrl':
          'https://tv24africa.com/wp-content/uploads/2020/07/THE-HEART-OF-A-WOMAN.jpg',
      'title': 'The Heart of a  Woman',
      'url': 'https://tv24africa.com/category/the-heart-of-a-woman/',
      'desc': '''''
This is a lifestyle talk show that features diverse and dynamic women from different backgrounds and life experiences, who share their views and opinions on'''
          ''
    },
    {
      'imgUrl':
          'https://tv24africa.com/wp-content/uploads/2020/07/trends-africa-3.jpg',
      'title': 'Cooperate  Business',
      'url': 'https://tv24africa.com/category/corporate-business/',
      'desc': '''''
Corporate Business is Africa’s business magazine show that analyses the facts and figures from the business world within the African continent.'''
          ''
    },
    {
      'imgUrl': 'https://tv24africa.com/wp-content/uploads/2020/07/SPORT-1.jpg',
      'title': 'Sports',
      'url': 'https://tv24africa.com/category/sport-tracks/',
      'desc': '''''

Sports Track is TV24 Africa’s sports show that overviews sporting events across Africa and beyond with results, highlights, summaries and discussions from those who know the business of sports.'''
          ''
    },
    {
      'imgUrl':
          'https://tv24africa.com/wp-content/uploads/2020/07/trends-africa-3.jpg',
      'title': 'Trendz Today',
      'url': 'https://tv24africa.com/category/trendz-today/',
      'desc': '''''


Trendz Today is a daily show highlighting trending issues and conversations across various social media platforms in Africa.'''
          ''
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFcc0000),
          title: Text("Programs"),
          elevation: 0.0,
          centerTitle: true,
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
              itemCount: programlist.length,
              itemBuilder: (BuildContext context, int index) {
                return ProgramList(
                  title: programlist[index]['title'],
                  imgUrl: programlist[index]['imgUrl'],
                  desc: programlist[index]['desc'],
                  onPressed: () {
                    _launchURL(programlist[index]['url']);
                  },
                );
              }),
        )
        );
  }

  

}

class ProgramList extends StatelessWidget {
  Function onPressed;
  String title;
  String imgUrl;
  String desc;
  ProgramList({this.desc, this.imgUrl, this.title, this.onPressed});

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
        Text(title, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
        Card(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Image.network(imgUrl,
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
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.redAccent[700],
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: GestureDetector(
                  onTap: onPressed,
                  child: Text(
                    'All Videos',
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