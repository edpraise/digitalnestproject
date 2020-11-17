import 'package:flutter/material.dart';
import 'package:tv24africa/pages/home_pageTabed.dart';

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
      'url': 'https://tv24africa.com/citizen-reporters/',
      'desc':
          'This Is Africa is the flagship programme of TV24 Africa which is designed to provide in-depth report and analysis of developmental issues in the African continent.'
    },
    {
      'imgUrl':
          'https://tv24africa.com/wp-content/uploads/2020/07/the-investigation.jpg',
      'title': 'The Investigation',
      'url': 'https://news.tv24africa.com/investigative-journalists/',
      'desc':
          'The investigation is TV24 Africa’s public interest program that uncovers secrets and reveals truths that are hidden from the public, especially regarding wrongdoings, corruption, injustice and abuse of power.',
    },
    {
      'imgUrl':
          'https://tv24africa.com/wp-content/uploads/2020/07/TV-24-AFRICAN-NEWS.jpg',
      'title': 'Tv24 Africa News',
      'url': 'https://news.tv24africa.com/investigative-journalists/',
      'desc':
          'This is the Daily Prime News Broadcast on TV24Africa covering major events in politics, governance, business, sports and happenings within and outside the African continent.'
    },
    {
      'imgUrl':
          'https://tv24africa.com/wp-content/uploads/2020/07/DATBREAK-AFRICAN-1-1.jpg',
      'title': 'Day break Africa',
      'url': 'https://news.tv24africa.com/investigative-journalists/',
      'desc':
          'Day Break Africa is an interactive live daily morning breakfast show that offers expert analysis on topical issues ranging from politics, business, entertainment, sports and many more issues around Sub-Saharan Africa.'
    },
    {
      'imgUrl': 'https://tv24africa.com/wp-content/uploads/2020/07/tv24.jpg',
      'title': 'Tv24 Africa Interview',
      'url': 'https://news.tv24africa.com/investigative-journalists/',
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
      'title': 'The change makers',
      'url': 'https://news.tv24africa.com/investigative-journalists/',
      'desc':
          'The change makers is a major highlights of Africa’s most dazzling trendsetters who carve a niche for themselves and use that to create changes for their communities, be it in art, travel, music, technology, architecture and fashion.'
    },
    {
      'imgUrl':
          'https://tv24africa.com/wp-content/uploads/2020/07/THE-HEART-OF-A-WOMAN.jpg',
      'title': 'The heart of a  woman',
      'url': 'https://news.tv24africa.com/investigative-journalists/',
      'desc': '''''
This is a lifestyle talk show that features diverse and dynamic women from different backgrounds and life experiences, who share their views and opinions on'''
          ''
    },
    {
      'imgUrl':
          'https://tv24africa.com/wp-content/uploads/2020/07/trends-africa-3.jpg',
      'title': 'Cooperate  business',
      'url': 'https://news.tv24africa.com/investigative-journalists/',
      'desc': '''''
Corporate Business is Africa’s business magazine show that analyses the facts and figures from the business world within the African continent.'''
          ''
    },
    {
      'imgUrl': 'https://tv24africa.com/wp-content/uploads/2020/07/SPORT-1.jpg',
      'title': 'Sports',
      'url': 'https://news.tv24africa.com/investigative-journalists/',
      'desc': '''''

Sports Track is TV24 Africa’s sports show that overviews sporting events across Africa and beyond with results, highlights, summaries and discussions from those who know the business of sports.'''
          ''
    },
    {
      'imgUrl':
          'https://tv24africa.com/wp-content/uploads/2020/07/trends-africa-3.jpg',
      'title': 'Sports',
      'url': 'https://news.tv24africa.com/investigative-journalists/',
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
        // body: Padding(
        //   padding: const EdgeInsets.all(10.0),
        //   child: ListView.builder(
        //       itemCount: programlist.length,
        //       itemBuilder: (BuildContext context, int index) {
        //         return ProgramsList(
        //           title: programlist[index]['title'],
        //           imgUrl: programlist[index]['imgUrl'],
        //           desc: programlist[index]['desc'],
        //           onPressed: () {
        //             _launchURL(programlist[index]['url']);
        //           },
        //         );
        //       }),
        // )
        );
  }

  

}