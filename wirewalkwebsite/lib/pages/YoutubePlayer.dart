import 'package:flutter/material.dart';
import 'package:wirewalkwebsite/constants.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubePlayer extends StatefulWidget {
  @override
  _YoutubePlayerState createState() => _YoutubePlayerState();
}

class _YoutubePlayerState extends State<YoutubePlayer> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'K18cpp_-gP8',
      params: YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Spacer(),
      Expanded(
          flex: 15,
          child: YoutubePlayerIFrame(
            controller: _controller,
            aspectRatio: 16 / 9,
          )),
      Container(height: 50),
      TextButton(
        child: Text(
          "Close",
          style: TextStyle(fontSize: 60),
        ),
        onPressed: () => Navigator.pop(context),
      ),
      Spacer()
    ]);
  }
}
