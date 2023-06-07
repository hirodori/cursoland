import 'package:flutter/material.dart';

class VideoPlayer extends StatefulWidget {
  final String url;
  VideoPlayer({Key? key, required this.url}) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [],
      )),
    );
  }
}
