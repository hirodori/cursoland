import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  final String url;
  const VideoPlayer({Key? key, required this.url}) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  YoutubePlayerController? _controller;
  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.url, // https://www.youtube.com/watch?v=Tb9k9_Bo-G4
      flags: const YoutubePlayerFlags(
        controlsVisibleAtStart: false,
        hideControls: false,
        autoPlay: true,
        mute: false,
        // isLive: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller!,
        showVideoProgressIndicator: true,
        /*  progressIndicatorColor: Color.fromARGB(255, 255, 48, 7),
        progressColors: ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),*/
      ),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Youtube Player"),
          ),
          body: player,
        );
      },
    );
  }
}
