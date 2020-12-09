import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_html/html_parser.dart';

class CurrentPlay extends StatefulWidget {
  final List<dynamic> podcastScreen;
  final int index;
  final String url;
  final String title;

  const CurrentPlay(
      {Key key, this.url, this.title, this.podcastScreen, this.index})
      : super(key: key);
  @override
  _CurrentPlayState createState() => _CurrentPlayState(index, podcastScreen);
}

class _CurrentPlayState extends State<CurrentPlay> {
  final int index;
  final List<dynamic> podcastScreen;
  AudioPlayer audioPlayer = AudioPlayer();

  Duration duration = new Duration();
  Duration position = new Duration();

  bool playing = false;
  bool next = false;
  bool previous = false;

  int mainIndex;

  _CurrentPlayState(this.index, this.podcastScreen);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mainIndex = index;
     getAudio(widget.podcastScreen[mainIndex]['audioUrl']);
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.stop();
    audioPlayer.dispose();
  }

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
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: SweepGradient(colors: [
                        Colors.black,
                        Colors.black54,
                        Colors.black38,
                        Colors.black45,
                      ], stops: [
                        0.8,
                        0.96,
                        0.74,
                        0.22,
                        0.85
                      ], startAngle: 0.5, endAngle: 1),
                    ),
                  ),
                  Container(
                    height: 270,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/disc.jpg')),
                        shape: BoxShape.circle,
                        color: Colors.redAccent[700]),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(widget.podcastScreen[mainIndex]['title'],
                  style: TextStyle(fontSize: 20, color: Colors.black)),
              slider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: Cross,
                children: [
                  InkWell(
                    onTap: () {
                      prevSong();
                    },
                    child: Icon(
                      Icons.fast_rewind,
                      size: 40,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      getAudio(widget.podcastScreen[mainIndex]['audioUrl']);
                    },
                    child: Icon(
                      playing == false
                          ? Icons.play_circle_filled_outlined
                          : Icons.pause_circle_filled,
                      size: 50,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      nextSong();
                    },
                    child: Icon(
                      Icons.fast_forward,
                      size: 40,
                    ),
                  ),
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

  nextSong()async {
    if (mainIndex != podcastScreen.length - 1)  {
       audioPlayer.stop();
      setState(() {
        mainIndex++;
      });
      await audioPlayer.play(widget.podcastScreen[mainIndex]['audioUrl'], isLocal: true);

    } else {
      audioPlayer.stop();
      setState(() {
        mainIndex = 0;
      });
       await audioPlayer.play(widget.podcastScreen[mainIndex]['audioUrl'], isLocal: true);
    }
  }

  prevSong() async{
    if (mainIndex != 0) {
       audioPlayer.stop();
      setState(() {
        mainIndex--;
      });
       await audioPlayer.play(widget.podcastScreen[mainIndex]['audioUrl'], isLocal: true);
    } else {
      audioPlayer.stop();
      setState(() {
        mainIndex = podcastScreen.length - 1;
      });
        await audioPlayer.play(widget.podcastScreen[mainIndex]['audioUrl'], isLocal: true);
    }
  }
}
