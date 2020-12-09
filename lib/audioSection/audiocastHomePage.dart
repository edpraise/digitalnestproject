import 'package:flutter/material.dart';
import 'package:tv24africa/audioSection/currentPlayList.dart';

class AudioCastPage extends StatefulWidget {
  @override
  _AudioCastPageState createState() => _AudioCastPageState();
}

class _AudioCastPageState extends State<AudioCastPage> {
  List audioCastList = [
    {
      'imgUrl':
          'https://tv24africa.com/wp-content/uploads/2020/09/IMG_1828.jpg',
      'audioUrl':
          'https://tv24africa.com/wp-content/uploads/2020/09/FOCAL-POINT-1-2.mp3',
      'title': 'Matters of the Heart',
    },
    {
      'imgUrl':
          'https://tv24africa.com/wp-content/uploads/2020/09/IMG_1505.jpg',
      'audioUrl':
          'https://tv24africa.com/wp-content/uploads/2020/09/Focal-Point-1-2.mp3',
      'title': 'Stimulating the Economy of Kogi State',
    },
    {
      'imgUrl':
          'https://tv24africa.com/wp-content/uploads/2020/09/IMG_1506.jpg',
      'audioUrl':
          'https://tv24africa.com/wp-content/uploads/2020/09/FOCAL-POINT-1.mp3',
      'title': 'Focal Point: Diversifying the Economy of Kogi State',
    },
    {
      'imgUrl':
          'https://tv24africa.com/wp-content/uploads/2020/09/IMG_1464-1068x586.jpg',
      'audioUrl':
          'https://tv24africa.com/wp-content/uploads/2020/09/FOCAL-POINT.mp3',
      'title': 'Turning Around the Internal Revenue Generation of Kogi State',
    },
    // {
    //   'imgUrl': 'assets/images/pc.jpg',
    //   'audioUrl': '',
    //   'title':
    //       'What Nigerian Leader’s New Chief of Staff Said About Serving the...',
    // },
    // {
    //   'imgUrl': 'assets/images/pc.jpg',
    //   'audioUrl': '',
    //   'title':
    //       'The Moment Ibrahim Gambari, the New Chief of Staff to Nigerian...',
    // },
    // {
    //   'imgUrl': 'assets/images/pc.jpg',
    //   'audioUrl': '',
    //   'title': 'Fuel Scarcity in Nigeria’s Commercial City of Lagos In 1975',
    // },
    // {
    //   'imgUrl': 'assets/images/pc.jpg',
    //   'audioUrl': '',
    //   'title': 'People Across African Countries Debating The Use Of Face Masks',
    // },
    // {
    //   'imgUrl': 'assets/images/pc.jpg',
    //   'audioUrl':
    //       '',
    //   'title':
    //       'Official Prayer at the Parliament of the Federal Republic of Nigeria',
    // },
    // {
    //   'imgUrl': 'assets/images/pc.jpg',
    //   'audioUrl': '',
    //   'title': 'The History of the Making of Abuja',
    // },
    // {
    //   'imgUrl': 'assets/images/pc.jpg',
    //   'audioUrl': '',
    //   'title':
    //       'Senate The Moment Handshake Became Extinct in the Nigerian Senate',
    // },
    // {
    //   'imgUrl': 'assets/images/pc.jpg',
    //   'audioUrl': '',
    //   'title': 'Sudan’s Albashir in Court',
    // },
    // {
    //   'imgUrl': 'assets/images/pc.jpg',
    //   'audioUrl': '',
    //   'title': 'President Jonathan Visit President Buhari',
    // },
    // {
    //   'imgUrl': 'assets/images/pc.jpg',
    //   'audioUrl': '',
    //   'title': 'South Africa Virus',
    // },
  ];
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        body: ListView.builder(
      itemCount: audioCastList.length,
      itemBuilder: (BuildContext context, int index) {
        if (index == audioCastList.length - 1) {
          return Padding(
            padding: const EdgeInsets.only(left:80,right: 80, top: 30),
            child: GestureDetector(
              onTap: (){
                     var snackBar = SnackBar(content: Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20)
                       ),
                       child: Row(
                                             children: [
                                               Text('No more podcast  at the time'),
                                               Icon(Icons.not_accessible)
                                             ],
                                           ),
                     ),
                                         );
            _scaffoldKey.currentState.showSnackBar(snackBar);
              },
                          child: Container(
                height: 50,
                // width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFbd1017),
                ),
                child: Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Tap to load more'),
                )),
              ),
            ),
          );
        }
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CurrentPlay(
                      podcastScreen:audioCastList ,
                       index: index,
                        url: audioCastList[index]['audioUrl'],
                        title: audioCastList[index]['title'])));
          },
          child: Pdc(
            title: audioCastList[index]['title'],
            imgUrl: audioCastList[index]['imgUrl'],
          ),
        );
      },
    ));
  }
}

class Pdc extends StatelessWidget {
  String title;
  String imgUrl;
  Pdc({this.imgUrl, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3.0, left: 10, right: 10),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: Image(
                      image: NetworkImage(
                    imgUrl,
                  )),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: 40,
                      child: Text(
                        title,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Icon(Icons.music_note, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
