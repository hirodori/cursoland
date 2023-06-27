import 'package:flutter/cupertino.dart';

class Video with ChangeNotifier {
  final String url;
  final String nameVideo;
  final Duration duration;
  bool seen;

  Video(
      {required this.url,
      required this.nameVideo,
      required this.duration,
      this.seen = false});

  void checkVideo() {
    seen = true;
    //  notifyListeners();
  }

  Map<String, dynamic> toJson() {
    return {
      'name': nameVideo,
      'url': url,
      'duration': duration.inSeconds,
    };
  }

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      nameVideo: json['name'],
      url: json['url'],
      duration: Duration(seconds: json['duration']),
    );
  }
}
