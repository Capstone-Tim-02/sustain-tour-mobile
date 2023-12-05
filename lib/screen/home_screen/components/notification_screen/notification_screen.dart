import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/notification_screen/components/empty_notification_component/empty_notification_component.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/notification_screen/components/notification_list_component/notification_list_component.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/notification_screen/notification_provider.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Notifikasi',
          style: TextStyleWidget.titleT2(
            fontWeight: FontWeightStyle.semiBold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 32, bottom: 16),
        child: Consumer<NotificationProvider>(
          builder: (context, notifProvider, child) {
            if (notifProvider.isLoading) {
              return NotificationListComponent(
                notifs: notifProvider.notificationModel.notifications ?? [],
                enabled: true,
              );
            } else if (!notifProvider.isLoading) {
              if (notifProvider.notificationModel.notifications == null) {
                return const EmptyNotificationComponent();
              }
              return NotificationListComponent(
                notifs: notifProvider.notificationModel.notifications!,
                enabled: false,
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
