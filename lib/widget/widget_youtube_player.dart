import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubePlayerWidget extends StatelessWidget {
  final String? linkVid;
  const YoutubePlayerWidget({super.key, required this.linkVid});

  @override
  Widget build(BuildContext context) {
    final videoURL = linkVid ?? "https://www.youtube.com/watch?v=ts8i-6AtDfc";
    final videoID =
        YoutubePlayerController.convertUrlToId(videoURL) ?? "InvalidID";

    final youtubeController = YoutubePlayerController.fromVideoId(
      videoId: videoID,
      autoPlay: false,
      params: const YoutubePlayerParams(
        mute: false,
        showControls: true,
      ),
    );
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
