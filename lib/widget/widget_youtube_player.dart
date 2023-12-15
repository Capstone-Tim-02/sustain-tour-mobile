import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubePlayerWidget extends StatelessWidget {
  final YoutubePlayerController youtubeController;

  const YoutubePlayerWidget({super.key, required this.youtubeController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 202,
      width: 380,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: YoutubePlayer(
        controller: youtubeController,
        aspectRatio: 16 / 9,
      ),
    );
  }
}
