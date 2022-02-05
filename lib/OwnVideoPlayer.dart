// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// class OwnVideoPlayer extends StatefulWidget {
//   final VideoPlayerController videoPlayerController;
//   bool lopping = false;
//
//   OwnVideoPlayer({
//     required this.videoPlayerController, // Link of the video
//     bool? lopping,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   _OwnVideoPlayerState createState() => _OwnVideoPlayerState();
// }
//
// class _OwnVideoPlayerState extends State<OwnVideoPlayer> {
//   late ChewieController _chewieController;
//
//   @override
//   void initState() {
//     super.initState();
//     _chewieController = ChewieController(
//         videoPlayerController: widget.videoPlayerController,
//         aspectRatio: widget.videoPlayerController.value.aspectRatio,
//         autoInitialize: true,
//         looping: widget.lopping,
//         errorBuilder: (context, errorMessage) {
//           return new Center(
//             child: new Text(
//               errorMessage,
//               style: new TextStyle(color: Colors.white),
//             ),
//           );
//         });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Chewie(
//       controller: _chewieController,
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     widget.videoPlayerController.dispose();
//     _chewieController.dispose();
//   }
// }
//
//
