import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tv24africa/models/channel_model.dart';
import 'package:tv24africa/models/video_model.dart';
import 'package:tv24africa/screens/playVideos.dart';
import 'package:tv24africa/services/youtube_api.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Videos extends StatefulWidget {
  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {


  Future<void> _launchFacebook(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceded =
          await launch(url, forceSafariVC: false, universalLinksOnly: true);
      if (!nativeAppLaunchSucceded) {
        await launch(url, forceSafariVC: true);
      }
    }
  }

  Future<void> _launchtweeter(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceded =
          await launch(url, forceSafariVC: false, universalLinksOnly: true);
      if (!nativeAppLaunchSucceded) {
        await launch(url, forceSafariVC: true);
      }
    }
  }

  Future<void> _launchInstagram(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceded =
          await launch(url, forceSafariVC: false, universalLinksOnly: true);
      if (!nativeAppLaunchSucceded) {
        await launch(url, forceSafariVC: true);
      }
    }
  }

  Future<void> _launchYouTube(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceded =
          await launch(url, forceSafariVC: false, universalLinksOnly: true);
      if (!nativeAppLaunchSucceded) {
        await launch(url, forceSafariVC: true);
      }
    }
  }

  Future<void> _launchLinkedIn(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceded =
          await launch(url, forceSafariVC: false, universalLinksOnly: true);
      if (!nativeAppLaunchSucceded) {
        await launch(url, forceSafariVC: true);
      }
    }
  }


   String url = 'https://youtu.be/dCGnHwlMsu0';
  YoutubePlayerController _controller;
  final String phoneNumber1 = "08139027050";
  Channel _channel;
  bool _isLoading = false;

  @override
  void initState() {
     _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url),
    );
    super.initState();
    _initChannel();
  }

  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: 'UCuBry0S8HC_vRVJHzKA7dyg');
    setState(() {
      _channel = channel;
    });
  }

  _buildVideo(Video video) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VideoScreen(video: video),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        // padding: EdgeInsets.all(8.0),
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color(0xFF000000),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              offset: Offset(1, 0),
              blurRadius: 1.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Container(
                height: 300.0,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(video.thumbnailUrl),
                        fit: BoxFit.cover)),
              ),
              SizedBox(width: 8.0, height: 8),
              Expanded(
                child: Text(
                  video.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _loadMoreVideos() async {
    _isLoading = true;
    List<Video> moreVideos = await APIService.instance
        .fetchVideosFromPlaylist(playlistId: _channel.uploadPlaylistId);
    List<Video> allVideos = _channel.videos..addAll(moreVideos);
    setState(() {
      _channel.videos = allVideos;
    });
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height / 3,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xFFbd1017),
                    ),
                    child: YoutubePlayer(
                      controller: _controller,
                    ),
                  ),
                  // Positioned(
                  //   right: 10,
                  //   bottom: 5,
                  //   child: Container(
                  //     height: 60,
                  //     width: 60,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(60),
                  //         color: Colors.black87),

                  //     child: IconButton(
                  //       color: Colors.white,
                  //       icon: Padding(
                  //         padding: const EdgeInsets.all(4.0),
                  //         child: Icon(
                  //           Icons.call,
                  //           color: Color(0xFFcc0000),
                  //           size: 35,
                  //         ),
                  //       ),
                  //       onPressed: () {
                  //         callnow();
                  //       },
                  //     ),
                  //     //  child: Icon(Icons.call, color: Colors.white, size: 40,),
                  //   ),
                  // )
                ],
              )),
          SizedBox(height: 2),
          Column(
            children: [
              _channel != null
                  ? NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification scrollDetails) {
                        if (!_isLoading &&
                            _channel.videos.length !=
                                int.parse(_channel.videoCount) &&
                            scrollDetails.metrics.pixels ==
                                scrollDetails.metrics.maxScrollExtent) {
                          _loadMoreVideos();
                        }
                        return false;
                      },
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _channel.videos.length,
                        itemBuilder: (BuildContext context, int index) {
                          // if (index == 0) {
                          //   return _buildProfileInfo();
                          // }
                           if (index == _channel.videos.length - 1) {
                            return Container(
                             
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                icon: FaIcon(
                                                  FontAwesomeIcons.facebook,
                                                  color: Color(0xFFbd1017),
                                                ),
                                                onPressed: () {
                                                   _launchFacebook(
                                                      'https://web.facebook.com/TV24Africa?_rdc=1&_rdr');
                                                },
                                              ),
                                              IconButton(
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.twitter,
                                                    color: Color(0xFFbd1017),
                                                  ),
                                                  onPressed: () {
                                                    _launchtweeter(
                                                        'https://twitter.com/TV24Africa');
                                                  }),
                                              IconButton(
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.instagram,
                                                    color: Color(0xFFbd1017),
                                                  ),
                                                  onPressed: () {
                                                    _launchInstagram(
                                                        'https://www.instagram.com/tv24africa/');
                                                  }),
                                              IconButton(
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.youtube,
                                                    color: Color(0xFFbd1017),
                                                  ),
                                                  onPressed: () {
                                                     _launchYouTube(
                                                        'https://www.youtube.com/channel/UCuBry0S8HC_vRVJHzKA7dyg');
                                                  }),
                                              IconButton(
                                                  icon: FaIcon(
                                                      FontAwesomeIcons.linkedinIn,
                                                      color: Color(0xFFbd1017)),
                                                  onPressed: () {
                                                      _launchLinkedIn(
                                                        'https://www.linkedin.com/company/unavailable/');
                                                  }),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                    Center(
                  child: Text("CopyRight @ Tv24Africa 2020",
                      style: TextStyle(color: Color(0xFFbd1017), fontSize: 15)),
                )
                                ],
                              ),
                            );
                          }
                          Video video = _channel.videos[index];
                          return _buildVideo(video);
                          
                        },
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.redAccent[700],
                      ),
                    ),
                //      Center(
                //   child: Text("CopyRight @ Tv24Africa 2020",
                //       style: TextStyle(color: Color(0xFFbd1017), fontSize: 15)),
                // )
            ],
          ),
       
        ],
      ),
    ));
  }

  callnow() {
    String phoneNumber = "tel:" + phoneNumber1;
    launch(phoneNumber);
  }
}
