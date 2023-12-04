import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/api/notification_api.dart';
import 'package:sustain_tour_mobile/models/notification_model/notification_model.dart';

class NotificationProvider extends ChangeNotifier {
  NotificationModel _notificationModel = NotificationModel(
    code: 0,
    error: true,
    message: '',
    notifications: [],
  );
  NotificationModel get notificationModel => _notificationModel;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  bool _isContainUnreadNotif = false;
  bool get isContainUnreadNotif => _isContainUnreadNotif;

  Future<void> getNotifications() async {
    try {
      _isLoading = true;
      notifyListeners();
      _notificationModel = await NotificationApi.getNotifications();

      for (var notif in _notificationModel.notifications) {
        if (notif.status == 'unread') {
          _isContainUnreadNotif = true;
          break;
        }
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }
}
