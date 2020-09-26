import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tv24africa/models/channel_model.dart';
import 'package:tv24africa/models/video_model.dart';
import 'package:tv24africa/screens/playVideos.dart';
import 'package:tv24africa/services/youtube_api.dart';

class Videos extends StatefulWidget {
  @override
  _VideosState createState() => _VideosState();
}

class _VideosState extends State<Videos> {
  Channel _channel;
  bool _isLoading = false;

  @override
  void initState() {
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
        child: Row(
          children: <Widget>[
            Container(
              height: 300.0,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(video.thumbnailUrl),
                fit: BoxFit.cover
              )),
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
      body:SingleChildScrollView(
              child: Column(
            children: [
              Column(
                children: [
         _channel != null
          ? NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollDetails) {
                if (!_isLoading &&
                    _channel.videos.length != int.parse(_channel.videoCount) &&
                    scrollDetails.metrics.pixels ==
                        scrollDetails.metrics.maxScrollExtent) {
                  _loadMoreVideos();
                }
                return false;
              },
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _channel.videos.length=5,
                itemBuilder: (BuildContext context, int index) {
                  // if (index == 0) {
                  //   return _buildProfileInfo();
                  // }
                  Video video = _channel.videos[index];
                  return _buildVideo(video);
                },
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
                ],
              ),
       
               Row(
                 children: [
                   Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                      children: [
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.facebook),
                          onPressed: () {},
                        ),
                        IconButton(
                            icon: FaIcon(FontAwesomeIcons.twitter), onPressed: () {}),
                        IconButton(
                            icon: FaIcon(FontAwesomeIcons.instagram), onPressed: () {}),
                      ],
                ),
              ),
            ),
                 ],
               ),
                Container(
              child: Text(
            "CopyRight by Tv24Africa @ 2020",
            style: TextStyle(color: Colors.redAccent[700]),
          ))
            ],
          ),
      )
     
    );
  }
}
