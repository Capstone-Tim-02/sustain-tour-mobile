import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/api/booking_api.dart';
import 'package:sustain_tour_mobile/models/api/notification_api.dart';
import 'package:sustain_tour_mobile/models/booking_models/booking_history_model.dart';
import 'package:sustain_tour_mobile/models/notification_model/notification_model.dart';

class NotificationProvider extends ChangeNotifier {
  NotificationModel _notificationModel = NotificationModel(
    code: 0,
    error: true,
    message: '',
    notifications: [],
  );
  NotificationModel get notificationModel => _notificationModel;

  BookingHistoryModel _bookingHistoryModel = BookingHistoryModel(
    code: 0,
    error: true,
    message: '',
    ticketData: [],
  );
  BookingHistoryModel get bookingHistoryModel => _bookingHistoryModel;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String _messageError = '';
  String get messageError => _messageError;

  bool _isContainUnreadNotif = false;
  bool get isContainUnreadNotif => _isContainUnreadNotif;

  Future<void> getNotifications() async {
    try {
      _isLoading = true;
      notifyListeners();
      _notificationModel = await NotificationApi.getNotifications();

      if (_notificationModel.notifications != null) {
        for (var notif in _notificationModel.notifications!) {
          if (notif.status == 'unread') {
            _isContainUnreadNotif = true;
            break;
          } else {
            _isContainUnreadNotif = false;
          }
        }
      } else {
        _isContainUnreadNotif = false;
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> markAsReadNotification({required int notifId}) async {
    try {
      bool isDoneUpdate = false;
      isDoneUpdate =
          await NotificationApi.markAsReadNotification(notifId: notifId);

      _isLoading = true;
      notifyListeners();

      if (isDoneUpdate) {
        await getNotifications();
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getBookingByInvoice({required String invoiceNumber}) async {
    try {
      _bookingHistoryModel =
          await BookingApi.getBookingByInvoice(invoiceNumber: invoiceNumber);

      _messageError = '';
    } catch (e) {
      _messageError = 'Terjadi Kesalahan';
    }
  }
}
