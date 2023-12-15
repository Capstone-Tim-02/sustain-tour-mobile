import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/api/detail_wisata_byid_api.dart';
import 'package:sustain_tour_mobile/models/detail_wisata_byid_models/detail_wisata_byid_models.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DetailWisataProvider extends ChangeNotifier {
  final DetailWisataApi _detailWisataApi = DetailWisataApi();
  DetailWisataByid? _detailWisata;
  bool _isLoading = true;

  YoutubePlayerController _youtubeController = YoutubePlayerController.fromVideoId(
    videoId: YoutubePlayerController.convertUrlToId("https://www.youtube.com/watch?v=ts8i-6AtDfc") ?? "InvalidID",
    autoPlay: false,
    params: const YoutubePlayerParams(
      mute: false,
      showControls: true,
    )
  );

  DetailWisataByid? get detailWisata => _detailWisata;
  bool get isLoading => _isLoading;
  YoutubePlayerController get youtubeController => _youtubeController;

  Future<void> getDetailWisataById(int id) async {
    try {
      _isLoading = true;
      notifyListeners();
      _detailWisata = await _detailWisataApi.getDetailWisataById(id);
      createYoutubeController(
        videoURL: detailWisata!.wisata.videoLink
      );
    } catch (error) {
      error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void createYoutubeController({
    required String videoURL
  }) {
    _youtubeController = YoutubePlayerController.fromVideoId(
      videoId: YoutubePlayerController.convertUrlToId(videoURL) ?? "InvalidID",
      autoPlay: false,
      params: const YoutubePlayerParams(
        mute: false,
        showControls: true,
      )
    );
  }

  void stopYoutubeVideo(){
    _youtubeController.stopVideo();
  }
}
