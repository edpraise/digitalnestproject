
// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:tv24africa/models/video_model.dart';

// class VideoScreen extends StatefulWidget {

//   final Video video;

//   VideoScreen({this.video});

//   @override
//   _VideoScreenState createState() => _VideoScreenState();
// }

// class _VideoScreenState extends State<VideoScreen> {
  
//   String link = 'https://tv24africa.com/';
//   Future<void> share(dynamic link, String title) async {
//     await FlutterShare.share(
//         title: 'Tv24 Africa',
//         text: title,
//         linkUrl: link,
//         chooserTitle: 'Share Tv24app with friends?');
//   }
//   YoutubePlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: widget.video.id,
//       flags: YoutubePlayerFlags(
//         mute: false,
//         autoPlay: true,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Color(0xFF1a1a1a),
//         body: SafeArea(
//           child: Column(
//       children: [
//         Container(height: 40,),
//         YoutubePlayer(
//           controller: _controller,
//           showVideoProgressIndicator: true,
//           onReady: () {
//             print('Player is ready.');
//           },
//         ),
//         SizedBox(height: 20),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Expanded(
//               child: Text(
//                 widget.video.title,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 15.0,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//         ),
//       ],
//     ),
//         ),
//       );
//   }
// }