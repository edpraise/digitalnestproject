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
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Latest PodCast'),
          SizedBox(height: 10),
          Image(
            image: AssetImage('assets/images/pd1.jpg'),
          ),
          slider(),
          InkWell(
            onTap: () {
              getAudio();
            },
            child: Icon(playing == false
                ? Icons.play_arrow_rounded
                : Icons.pause_circle_filled_outlined),
          ),
          Text('other podcasts'),
          Expanded(
                      child: ListView(
  children: const <Widget>[
    Card(child: ListTile(title: Text('News in Breif'))),
   Card(
      child: ListTile(
        leading: CircleAvatar(
  backgroundImage: AssetImage("assets/images/pd1.jpg")),
        title: Text('Three-line ListTile'),
        subtitle: Text(
            'A sufficiently long subtitle warrants three lines.'
        ),
        trailing: Icon(Icons.more_vert),
        isThreeLine: true,
      ),
    ),
    Card(
      child: ListTile(
        leading: CircleAvatar(
  backgroundImage: AssetImage("assets/images/pd1.jpg")),
        title: Text('Three-line ListTile'),
        subtitle: Text(
            'A sufficiently long subtitle warrants three lines.'
        ),
        trailing: Icon(Icons.more_vert),
        isThreeLine: true,
      ),
    ),
    Card(
      child: ListTile(
        title: Text('The Investigation'),
        dense: true,
      ),
    ),
    Card(
      child: ListTile(
        leading:  CircleAvatar(
  backgroundImage: AssetImage("assets/images/pd1.jpg")),
        title: Text('Two-line ListTile'),
        subtitle: Text('Here is a second line'),
        trailing: Icon(Icons.more_vert),
      ),
    ),
    Card(
      child: ListTile(
        leading:  CircleAvatar(
  backgroundImage: AssetImage("assets/images/pd1.jpg")),
        title: Text('Three-line ListTile'),
        subtitle: Text(
            'A sufficiently long subtitle warrants three lines.'
        ),
        trailing: Icon(Icons.more_vert),
        isThreeLine: true,
      ),
    ),
     Card(
      child: ListTile(
        title: Text('Everyday Matters'),
        dense: true,
      ),
    ),
     Card(
      child: ListTile(
        leading:  CircleAvatar(
  backgroundImage: AssetImage("assets/images/p2.jpg")),
        title: Text('Three-line ListTile'),
        subtitle: Text(
            'A sufficiently long subtitle warrants three lines.'
        ),
        trailing: Icon(Icons.more_vert),
        isThreeLine: true,
      ),
    ),
     Card(
      child: ListTile(
        leading:  CircleAvatar(
  backgroundImage: AssetImage("assets/images/p3.jpg")),
    title: Text('Focal Point: Diversifying the Economy of Kogi State'),
        trailing: Icon(Icons.play_arrow_rounded),
        // isThreeLine: true,
      ),
    ),
     Card(
      child: ListTile(
        leading:  CircleAvatar(
  backgroundImage: AssetImage("assets/images/p4.jpg")),
        title: Text('Stimulating the Economy of Kogi State'),
        // 
        trailing: Icon(Icons.play_arrow_rounded),
       
      ),
    ),
  ],
),
          )
        ],
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
