import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/booking_history_model/booking_history_model.dart';
import 'package:sustain_tour_mobile/screen/tiket_screen/component/invoice_screen_component/component/detail_transaksi_screen_component/component/detail_pesanan_component/detail_pesanan_component.dart';
import 'package:sustain_tour_mobile/screen/tiket_screen/component/invoice_screen_component/component/detail_transaksi_screen_component/component/header_detail_transaksi_component/header_detail_transaksi_component.dart';
import 'package:sustain_tour_mobile/screen/tiket_screen/component/invoice_screen_component/component/detail_transaksi_screen_component/component/info_order_component/info_order_component.dart';
import 'package:sustain_tour_mobile/screen/tiket_screen/component/invoice_screen_component/component/detail_transaksi_screen_component/component/lokasi_tujuan_component/lokasi_tujuan_component.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class DetailTransaksiScreenComponent extends StatelessWidget {
  const DetailTransaksiScreenComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final TicketData tiketData =
        ModalRoute.of(context)!.settings.arguments as TicketData;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Detail Transaksi',
          style: TextStyleWidget.titleT2(
            fontWeight: FontWeightStyle.semiBold,
          ),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 32,
            ),
            HeaderDetailTransaksiComponent(tiketData: tiketData),
            const SizedBox(
              height: 24,
            ),
            DetailPesananComponent(
              tiketData: tiketData,
            ),
            const SizedBox(
              height: 24,
            ),
            LokasiTujuanComponent(
              lokasiWisata: tiketData.lokasiWisata,
              mapsLink: tiketData.mapsLink,
              latTarget: tiketData.lat,
              longTarget: tiketData.long,
            ),
            const SizedBox(
              height: 32,
            ),
            InfoOrderComponent(
              subTotal: tiketData.hargaSebelumDiskon,
              potonganPromo: tiketData.totalPotonganKodeVoucher,
              potonganPoint: tiketData.totalPotonganPoints,
              pointsEarned: tiketData.pointsEarned,
              totalCost: tiketData.totalCost,
              statusOrder: tiketData.statusOrder,
            ),
            // const SizedBox(
            //   height: 32,
            // ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
