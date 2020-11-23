import 'package:flutter/material.dart';
import 'package:tv24africa/audioSection/currentPlayList.dart';

class AudioCastPage extends StatefulWidget {
  @override
  _AudioCastPageState createState() => _AudioCastPageState();
}

class _AudioCastPageState extends State<AudioCastPage> {
  List audioCastList = [
    {
      'imgUrl': 'assets/images/pc.jpg',
      'audioUrl': 'https://tv24africa.com/wp-content/uploads/2020/09/FOCAL-POINT-1-2.mp3',
      'title': 'Matters of the Heart',
    },
    {
      'imgUrl': 'assets/images/pc.jpg',
      'audioUrl': 'https://tv24africa.com/wp-content/uploads/2020/09/Focal-Point-1-2.mp3',
      'title': 'Stimulating the Economy of Kogi State',
    },
    {
      'imgUrl': 'assets/images/pc.jpg',
      'audioUrl': 'https://tv24africa.com/wp-content/uploads/2020/09/FOCAL-POINT-1.mp3',
      'title': 'Focal Point: Diversifying the Economy of Kogi State',
    },
    {
      'imgUrl': 'assets/images/pc.jpg',
      'audioUrl': 'https://tv24africa.com/wp-content/uploads/2020/09/FOCAL-POINT.mp3',
      'title': 'Turning Around the Internal Revenue Generation of Kogi State',
    },
    {
      'imgUrl': 'assets/images/pc.jpg',
      'audioUrl': '',
      'title':
          'What Nigerian Leader’s New Chief of Staff Said About Serving the...',
    },
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: audioCastList.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CurrentPlay(url:audioCastList[index]['audioUrl'],title: audioCastList[index]['title'])));
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
      padding: const EdgeInsets.only(top:3.0, left: 10, right:10),
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
                      image: AssetImage(
                    imgUrl,
                  )),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    width: 40,
                    child: Text(
                      title,
                      style: TextStyle(color: Colors.white),
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
