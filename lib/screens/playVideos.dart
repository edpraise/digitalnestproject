import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tv24africa/screens/settinng.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:tv24africa/models/video_model.dart';
import 'package:flutter_share/flutter_share.dart';

// import "dart:ui" as ui;
class VideoScreen extends StatefulWidget {
  final Video video;

  VideoScreen({this.video});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  Future<void> share(String title) async {
    await FlutterShare.share(
        title: widget.video.title,
        text: title,
        linkUrl: widget.video.thumbnailUrl,
        chooserTitle: 'Share this video link with friends?');
  }

  YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.video.id,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFbd1017),
        title: Image.asset(
          'assets/images/ic.png',
          fit: BoxFit.cover,
          height: 50,
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()));
            },
          )
        ],
      ),
      backgroundColor: Color(0xFF1a1a1a),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 1.8,
                  child: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    onReady: () {
                      print('Player is ready.');
                    },
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.video.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            // bottom: 1,
            left: 20,
            top: 80,
            // right: -1,
            child: InkWell(
              onTap: () {
                share('text');
              },
              child: Container(
                child: Icon(
                  Icons.share,
                  size: 40,
                  color: Colors.redAccent[700],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
