import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';
import 'package:sustain_tour_mobile/models/notification_model/notification_model.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/notification_screen/components/notification_tile_component_widget/notification_tile_component_widget.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/notification_screen/notification_provider.dart';
import 'package:sustain_tour_mobile/screen/promo_screen/component/detail_promo_screen.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/widget/snack_bar_widget.dart';

class NotificationListComponent extends StatelessWidget {
  final List<Notifikasi> notifs;
  final bool enabled;
  const NotificationListComponent({
    super.key,
    required this.notifs,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled,
      ignoreContainers: true,
      child: RefreshIndicator(
        onRefresh: () async {
          Provider.of<NotificationProvider>(context, listen: false)
              .getNotifications();
        },
        child: ListView.separated(
          itemBuilder: (context, index) {
            var notif = notifs[index];
            if (notif.isRead) {
              if (notif.label == 'Promo') {
                return NotificationTileComponentWidget(
                  iconSvg: Assets.assetsIconsNotifPromoRead,
                  title: notif.title.isEmpty ? notif.label : notif.title,
                  createdAt: notif.createdAt ?? DateTime.now(),
                  message: notif.message,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailPromoScreen(
                          promoId: notif.promoId ?? -1,
                        ),
                      ),
                    );
                  },
                );
              } else if (notif.label == 'Pembayaran') {
                return NotificationTileComponentWidget(
                  iconSvg: Assets.assetsIconsNotifTicketRead,
                  title: notif.title.isEmpty ? notif.label : notif.title,
                  createdAt: notif.createdAt ?? DateTime.now(),
                  message: notif.message,
                  onTap: () async {
                    final notifProvider = Provider.of<NotificationProvider>(
                      context,
                      listen: false,
                    );
                    String invoiceNumber = (notif.invoiceNumber != null &&
                            notif.invoiceNumber!.isNotEmpty)
                        ? notif.invoiceNumber!
                        : 'sdflhs';
                    await notifProvider.getBookingByInvoice(
                      invoiceNumber: invoiceNumber,
                    );

                    if (!context.mounted) return;

                    if (notifProvider.messageError.isEmpty) {
                      Navigator.pushNamed(context, Routes.invoiceScreen,
                          arguments: notifProvider
                              .bookingHistoryModel.ticketData?.first);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBarWidget.snackBarWidget(
                              message: notifProvider.messageError));
                    }
                  },
                );
              } else {
                return NotificationTileComponentWidget(
                  iconSvg: Assets.assetsIconsNotifTicketRead,
                  title: notif.title.isEmpty ? notif.label : notif.title,
                  createdAt: notif.createdAt ?? DateTime.now(),
                  message: notif.message,
                  onTap: () {
                    Provider.of<NotificationProvider>(context, listen: false)
                        .markAsReadNotification(notifId: notif.id);
                  },
                );
              }
            } else {
              if (notif.label == 'Promo') {
                return NotificationTileComponentWidget(
                  iconSvg: Assets.assetsIconsNotifPromoUnread,
                  title: notif.title.isEmpty ? notif.label : notif.title,
                  createdAt: notif.createdAt ?? DateTime.now(),
                  message: notif.message,
                  titleColor: ColorThemeStyle.blue100,
                  messageColor: ColorThemeStyle.black100,
                  timeColor: ColorThemeStyle.blue100,
                  backgroundColor: const Color(0xFFF2F4FD),
                  onTap: () {
                    Provider.of<NotificationProvider>(context, listen: false)
                        .markAsReadNotification(notifId: notif.id);

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailPromoScreen(
                          promoId: notif.promoId ?? -1,
                        ),
                      ),
                    );
                  },
                );
              } else if (notif.label == 'Pembayaran') {
                return NotificationTileComponentWidget(
                  iconSvg: Assets.assetsIconsNotifTicketUnread,
                  title: notif.title.isEmpty ? notif.label : notif.title,
                  createdAt: notif.createdAt ?? DateTime.now(),
                  message: notif.message,
                  titleColor: ColorThemeStyle.blue100,
                  messageColor: ColorThemeStyle.black100,
                  timeColor: ColorThemeStyle.blue100,
                  backgroundColor: const Color(0xFFF2F4FD),
                  onTap: () async {
                    Provider.of<NotificationProvider>(context, listen: false)
                        .markAsReadNotification(notifId: notif.id);

                    final notifProvider = Provider.of<NotificationProvider>(
                      context,
                      listen: false,
                    );

                    String invoiceNumber = (notif.invoiceNumber != null &&
                            notif.invoiceNumber!.isNotEmpty)
                        ? notif.invoiceNumber!
                        : 'sdflhs';

                    await notifProvider.getBookingByInvoice(
                      invoiceNumber: invoiceNumber,
                    );

                    if (!context.mounted) return;

                    if (notifProvider.messageError.isEmpty) {
                      Navigator.pushNamed(context, Routes.invoiceScreen,
                          arguments: notifProvider
                              .bookingHistoryModel.ticketData?.first);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBarWidget.snackBarWidget(
                              message: notifProvider.messageError));
                    }
                  },
                );
              } else {
                return NotificationTileComponentWidget(
                  iconSvg: Assets.assetsIconsNotifTicketRead,
                  title: notif.title.isEmpty ? notif.label : notif.title,
                  createdAt: notif.createdAt ?? DateTime.now(),
                  message: notif.message,
                  onTap: () {
                    Provider.of<NotificationProvider>(context, listen: false)
                        .markAsReadNotification(notifId: notif.id);
                  },
                );
              }
            }
          },
          separatorBuilder: (context, index) {
            return Container(
              height: 1,
              width: double.infinity,
              color: const Color(0xFFEAEAEA),
            );
          },
          itemCount: notifs.length,
        ),
      ),
    );
  }
}
