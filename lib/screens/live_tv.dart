import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tv24africa/models/channel_model.dart';
import 'package:tv24africa/models/video_model.dart';
import 'package:tv24africa/screens/playVideos.dart';
import 'package:tv24africa/services/youTube_api.dart';

class LiveVideo extends StatefulWidget {
  @override
  _LiveVideoState createState() => _LiveVideoState();
}

class _LiveVideoState extends State<LiveVideo> {
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
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        // padding: EdgeInsets.all(8.0),
        height: 400.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image(
                // height: 200,
                // width: 300,
                fit: BoxFit.contain,
                image: NetworkImage(video.thumbnailUrl),
              ),
            ),
            SizedBox(width: 8.0, height: 8),
            Expanded(
              child: Text(
                video.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
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
    Video singleVideo = _channel.videos[0];

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              singleVideo == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height / 2.5,
                      child: _channel != null
                          ? NotificationListener<ScrollNotification>(
                              onNotification:
                                  (ScrollNotification scrollDetails) {
                                if (!_isLoading &&
                                    _channel.videos.length !=
                                        int.parse(_channel.videoCount) &&
                                    scrollDetails.metrics.pixels ==
                                        scrollDetails.metrics.maxScrollExtent) {
                                  // _loadMoreVideos();
                                }
                                return false;
                              },
                              child: _buildVideo(singleVideo))
                          : Center(
                              child: CircularProgressIndicator(),
                            ),
                    ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Text("All ",
                        style: TextStyle(color: Colors.red, fontSize: 20)),
                    Text("Videos",
                        style: TextStyle(color: Colors.red, fontSize: 20)),
                  ],
                ),
              ),
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
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, crossAxisSpacing: 2.0),
                        shrinkWrap: true,
                        itemCount: _channel.videos.length,
                        itemBuilder: (BuildContext context, int index) {
                          Video video = _channel.videos[index];
                          return _buildVideo(video);
                        },
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
              Text("We Are Social",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: FaIcon(FontAwesomeIcons.facebook,
                          color: Colors.redAccent[700]),
                      onPressed: () {
                        print("Pressed");
                      }),
                  IconButton(
                      icon: FaIcon(FontAwesomeIcons.twitter,
                          color: Colors.redAccent[700]),
                      onPressed: () {
                        print("Pressed");
                      }),
                  IconButton(
                      icon: FaIcon(FontAwesomeIcons.instagram,
                          color: Colors.redAccent[700]),
                      onPressed: () {
                        print("Pressed");
                      }),
                  IconButton(
                      icon: FaIcon(FontAwesomeIcons.linkedinIn,
                          color: Colors.redAccent[700]),
                      onPressed: () {
                        print("Pressed");
                      })
                ],
              ),
              Text("CopyRight @ Tv24Africa 2020",
                  style: TextStyle(color: Colors.white, fontSize: 20))
            ],
          ),
        ),
      ),
    );
  }
}
