import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/constants/currency_format_const.dart';
import 'package:sustain_tour_mobile/constants/date_format_const.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';
import 'package:sustain_tour_mobile/models/booking_models/booking_history_model.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/alert_dialog_component/alert_dialog_component.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/component/detail_emission_screen_component/component/travel_history_component/travel_history_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/profile_provider.dart';
import 'package:sustain_tour_mobile/screen/tiket_screen/component/invoice_screen_component/component/step_payment_bottom_sheet_component/step_payment_bottom_sheet_component.dart';
import 'package:sustain_tour_mobile/screen/tiket_screen/tiket_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/badge_widget.dart';
import 'package:sustain_tour_mobile/widget/snack_bar_widget.dart';

class InvoiceContainerComponent extends StatelessWidget {
  final TicketData tiket;
  const InvoiceContainerComponent({super.key, required this.tiket});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 28,
      ),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          Text(
            tiket.wisataName,
            textAlign: TextAlign.center,
            // overflow: TextOverflow.ellipsis,
            style: TextStyleWidget.titleT1(
              fontWeight: FontWeightStyle.semiBold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            DateFormatConst.dateToTanggalHalfBulanTahunFormat
                .format(tiket.checkinBooking),
            style: TextStyleWidget.titleT3(
              color: ColorThemeStyle.grey100,
              fontWeight: FontWeightStyle.medium,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            CurrencyFormatConst.convertToIdr(tiket.totalCost, 0),
            style: TextStyleWidget.headlineH3(
              color: ColorThemeStyle.blue100,
              fontWeight: FontWeightStyle.semiBold,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          (tiket.statusOrder == 'pending')
              ? Image.asset(Assets.assetsImagesDiproses)
              : (tiket.statusOrder == 'success')
                  ? Image.asset(Assets.assetsImagesSelesai)
                  : Image.asset(Assets.assetsImagesDibatalkan),
          const SizedBox(
            height: 8,
          ),
          (tiket.statusOrder == 'dibatalkan')
              ? Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                        width: 0.5,
                        color: ColorThemeStyle.red,
                      )),
                  child: Text(
                    'DIBATALKAN',
                    style: TextStyleWidget.titleT1(
                      color: ColorThemeStyle.red,
                      fontWeight: FontWeightStyle.semiBold,
                    ),
                  ),
                )
              : Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                        width: 0.5,
                        color: ColorThemeStyle.blue100,
                      )),
                  child: Text(
                    tiket.statusOrder == 'pending' ? 'DIPESAN' : 'SELESAI',
                    style: TextStyleWidget.titleT1(
                      color: ColorThemeStyle.blue100,
                      fontWeight: FontWeightStyle.semiBold,
                    ),
                  ),
                ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Username',
                style: TextStyleWidget.titleT3(
                  color: ColorThemeStyle.grey100,
                  fontWeight: FontWeightStyle.medium,
                ),
              ),
              Consumer<ProfileProvider>(
                  builder: (context, profileProvider, child) {
                if (profileProvider.isLoading) {
                  return Text(
                    '-',
                    style: TextStyleWidget.titleT3(
                      color: ColorThemeStyle.black100,
                      fontWeight: FontWeightStyle.medium,
                    ),
                  );
                } else {
                  return Text(
                    profileProvider.user.name,
                    style: TextStyleWidget.titleT3(
                      color: ColorThemeStyle.black100,
                      fontWeight: FontWeightStyle.medium,
                    ),
                  );
                }
              })
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Kode pemesanan',
                style: TextStyleWidget.titleT3(
                  color: ColorThemeStyle.grey100,
                  fontWeight: FontWeightStyle.medium,
                ),
              ),
              Text(
                tiket.invoiceNumber,
                style: TextStyleWidget.titleT3(
                  color: ColorThemeStyle.black100,
                  fontWeight: FontWeightStyle.medium,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          (tiket.statusOrder == 'pending')
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Waktu tenggat',
                      style: TextStyleWidget.titleT3(
                        color: ColorThemeStyle.grey100,
                        fontWeight: FontWeightStyle.medium,
                      ),
                    ),
                    Text(
                      tiket.tenggatPembayaran == null
                          ? '-'
                          : DateFormatConst.dateToTanggalBulanTahunFormat
                              .format(tiket.tenggatPembayaran!),
                      style: TextStyleWidget.titleT3(
                        color: ColorThemeStyle.black100,
                        fontWeight: FontWeightStyle.medium,
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
          SizedBox(
            height: tiket.statusOrder == 'pending' ? 16 : 0,
          ),
          GestureDetector(
            key: const Key('Rincian Transaksi'),
            onTap: () {
              Navigator.pushNamed(context, Routes.detailTransaksiScreen,
                  arguments: tiket);
            },
            child: Row(
              children: [
                Text(
                  'Rincian Transaksi',
                  style: TextStyleWidget.bodyB2(
                    color: ColorThemeStyle.blue80,
                    fontWeight: FontWeightStyle.regular,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Icon(
                  Icons.arrow_forward,
                  size: 16,
                  color: ColorThemeStyle.blue80,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          (tiket.statusOrder == 'pending')
              ? Column(
                  children: [
                    BadgeWidget.container(
                      label: 'Tukarkan pada kasir',
                      padding: const EdgeInsets.all(16),
                      onPressed: () =>
                          StepPaymentBottomSheetComponent.buildBottomSheetSteps(
                              context),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Atau',
                      style: TextStyleWidget.bodyB2(
                        fontWeight: FontWeightStyle.semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    BadgeWidget.outline(
                      label: 'Batalkan pesanan',
                      fontWeight: FontWeightStyle.semiBold,
                      borderColor: ColorThemeStyle.red,
                      foregroundColor: ColorThemeStyle.red,
                      overlayColor: const Color.fromARGB(255, 252, 74, 74),
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 24),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialogComponent(
                                insetPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                contentPadding: const EdgeInsets.only(
                                    left: 24, right: 24, top: 42, bottom: 32),
                                text:
                                    'Apakah anda yakin ingin membatalkan pemesanan?',
                                onPressedNoButton: () => Navigator.pop(context),
                                onPressedYesButton: () async {
                                  final travelProvider =
                                      Provider.of<TravelHistoryProvider>(
                                          context,
                                          listen: false);
                                  await travelProvider.batalkanPesanan(
                                      invoiceNumber: tiket.invoiceNumber);

                                  if (!context.mounted) return;

                                  if (travelProvider
                                      .messageErrorBatalkanPesanan.isNotEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBarWidget.snackBarWidget(
                                            message: travelProvider
                                                .messageErrorBatalkanPesanan));
                                    travelProvider.clearErrorMessage();
                                  }
                                  Provider.of<TiketProvider>(context,
                                          listen: false)
                                      .setTabIndex(index: 1);
                                  Provider.of<ProfileProvider>(context,
                                          listen: false)
                                      .getUserData(userId: Provider.of<LoginProvider>(context,
                                          listen: false).userId ?? 0);
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      Routes.mainScreen, (route) => false);
                                },
                              );
                            });
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                )
              : const SizedBox(
                  height: 60,
                ),
        ],
      ),
    );
  }
}
