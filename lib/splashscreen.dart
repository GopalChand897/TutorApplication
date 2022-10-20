// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class SplashScreen extends StatefulWidget{
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   //video controller
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
  
//     _controller = VideoPlayerController.asset('assets/graduate.mp4',
//     )
//       ..initialize().then((_) {
//         setState(() {});
//       });
//      _playVideo();  
//   }
  
//   void _playVideo() async {
//     //playing videoutte
//     _controller.play();

//     //add delay till video is complete
//     await Future.delayed(const Duration(seconds: 4));

//     // navigating to home screen
//     Navigator.pushNamed(context, '/');
//   }

//   @override
//   void dispose() {
//       _controller.dispose();
//       super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: _controller.value.isInitialized
//             ? AspectRatio(
//                 aspectRatio: _controller.value.aspectRatio,
//                 child: VideoPlayer(
//                   _controller,
//                 ), //VideoPLayer
//               ) // AspectRatio
//             : Container(),  
//       ),  //Center
//     ); //Scaffold
//   }
// }