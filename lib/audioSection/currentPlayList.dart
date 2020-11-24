import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_html/html_parser.dart';

class CurrentPlay extends StatefulWidget {
  final String url;
  final String title;

  const CurrentPlay({Key key, this.url, this.title}) : super(key: key);
  @override
  _CurrentPlayState createState() => _CurrentPlayState();
}

class _CurrentPlayState extends State<CurrentPlay> {
  
  AudioPlayer audioPlayer = new AudioPlayer();

  Duration duration = new Duration();
  Duration position = new Duration();

  bool playing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black.withOpacity(0.2),
      appBar: AppBar(
        backgroundColor: Color(0xFFbd1017),
        title: Text('Now Playing'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Stack(
                           
                           children: [
                             Container(
                               height: 300,
                               width:MediaQuery.of(context).size.width,
                               decoration: BoxDecoration(
                                 gradient: SweepGradient(
              colors: [
                Colors.black,
                Colors.black54,
                Colors.black38,
                Colors.black45,
              ],
              stops: [0.8, 0.96, 0.74, 0.22, 0.85],
              startAngle: 0.5,
        endAngle: 1
            ),
          ),
                               ),
                             
                               Container(
                  height: 270,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration( 
                   
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/disc.jpg')
                    ),
                    shape: BoxShape.circle,
                    color: Colors.redAccent[700]  
                  ),
                 
                 
                )
                           ],
              ),
              SizedBox(height: 20,),
              Text(widget.title,style: TextStyle(fontSize: 20,color: Colors.black)),
              slider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Icon(
                  //   Icons.shuffle,
                  //   size: 50,
                  // ),
                  InkWell(
                    onTap: () {
                      getAudio(widget.url);
                    },
                    child: Icon(
                      playing == false
                          ? Icons.play_circle_filled_outlined
                          : Icons.pause_circle_filled,
                      size: 50,
                    ),
                  ),
                  // Icon(
                  //   Icons.skip_next,
                  //   size: 50,
                  // )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget slider() {
    return Slider.adaptive(
      activeColor: Colors.redAccent[700],
      inactiveColor: Colors.black,
      
        min: 0.0,
        max: duration.inSeconds.toDouble(),
        value: position.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            audioPlayer.seek((new Duration(seconds: value.toInt())));
          });
        });
  }

  void getAudio(String url) async {
    // var url = 'https://tv24africa.com/wp-content/uploads/2020/09/FOCAL-POINT-1-2.mp3';
    if (playing) {
      var res = await audioPlayer.pause();
      if (res == 1) {
        setState(() {
          playing = false;
        });
      }
    } else {
      var res = await audioPlayer.play(url, isLocal: true);
      if (res == 1) {
        setState(() {
          playing = true;
        });
      }
    }
    audioPlayer.onDurationChanged.listen((Duration dd) {
      setState(() {
        duration = dd;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((Duration dd) {
      setState(() {
        position = dd;
      });
    });
  }
}
