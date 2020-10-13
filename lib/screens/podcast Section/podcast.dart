// import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Podcast extends StatefulWidget {
  @override
  _PodcastState createState() => _PodcastState();
}

class _PodcastState extends State<Podcast> {
  AudioPlayer audioPlayer = new AudioPlayer();
  Duration duration = new Duration();
  Duration position = new Duration();

  String localFilePath;
  bool playing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Offstage(),
      ),
          body: SafeArea(
                      child: Stack(
              children: [
                Container(
                  height: 80,
                ),
                Container(
                  decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.black.withAlpha(10),
                Colors.black12,
                Colors.black45
              ],
            ),
        ),
                  child: Image.asset('assets/images/pdc.jpg', fit: BoxFit.contain),
                  // height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
               Container(
        child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text('Latest PodCast'),
                SizedBox(height: 10),
                // Image(
                //   image: AssetImage('assets/images/pd1.jpg'),
                // ),
                slider(),
                InkWell(
                  onTap: () {
                    getAudio();
                  },
                  child: Icon(playing == false
                      ? Icons.play_arrow_rounded
                      : Icons.pause_circle_filled_outlined,
                      size: 70,
                      ),
                ),
              ],
        ),
      ),

              ],
                       
            ),
          ),
    );
  }

  Widget slider() {
    return Slider.adaptive(
        min: 0.0,
        value: position.inMilliseconds.toDouble(),
        max: duration.inMilliseconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            audioPlayer.seek(Duration(seconds: value.toInt()));
          });
        });
  }

  void getAudio() async {
    var url = "https://luan.xyz/files/audio/ambient_c_motion.mp3";

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
      position = dd;
    });
  }
}
