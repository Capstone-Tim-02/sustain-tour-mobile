import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/notification_screen/components/empty_notification_component/empty_notification_component.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/notification_screen/notification_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

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
      body: Consumer<NotificationProvider>(
        builder: (context, notifProvider, child) {
          if (notifProvider.notificationModel.notifications.isEmpty) {
            return const EmptyNotificationComponent();
          } else {
            return ListView.separated(
              itemBuilder: (context, index) {
                var notif =
                    notifProvider.notificationModel.notifications[index];
                if (notif.status == 'read') {
                  return GestureDetector(
                    // onTap: () => ,
                    child: ListTile(
                      leading: SvgPicture.asset(
                        Assets.assetsIconsNotifTicketRead,
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Transaksi Sukses',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyleWidget.titleT3(
                                fontWeight: FontWeightStyle.medium,
                                color: ColorThemeStyle.grey100,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              timeago.format(notif.createdAt, locale: 'id'),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyleWidget.labelL4(
                                fontWeight: FontWeightStyle.medium,
                                color: ColorThemeStyle.grey100,
                              ),
                            ),
                          ),
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          notif.message,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyleWidget.bodyB3(
                            fontWeight: FontWeightStyle.medium,
                            color: ColorThemeStyle.grey100,
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: notifProvider.notificationModel.notifications.length,
            );
          }
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}
