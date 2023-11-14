import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/api/ai_api.dart';
import 'package:sustain_tour_mobile/models/ai_models/ai_models.dart';

class AiScreenProvider extends ChangeNotifier {
  bool _isLoadingAnswer = false;
  bool get isLoadingAnswer => _isLoadingAnswer;

  final TextEditingController _messageController = TextEditingController();
  TextEditingController get messageController => _messageController;

  AiModels? _openAiAnswer;
  AiModels? get openAiAnswer => _openAiAnswer;

  Future<void> getRecommendation() async {
    try {
      _isLoadingAnswer = true;
      notifyListeners();
      _openAiAnswer = await AiAPI.postDataWithAuthorization(
          message: _messageController.text);
      notifyListeners();

      _isLoadingAnswer = false;
      notifyListeners();
    } catch (e) {
      _isLoadingAnswer = false;
      notifyListeners();
    }
  }

  void resetFields(
    TextEditingController messageController,
  ) {
    messageController.clear();
    notifyListeners();
  }
}
