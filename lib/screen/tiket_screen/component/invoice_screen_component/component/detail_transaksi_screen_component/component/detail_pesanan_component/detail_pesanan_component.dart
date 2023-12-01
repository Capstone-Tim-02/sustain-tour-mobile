import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/booking_models/booking_history_model.dart';
import 'package:sustain_tour_mobile/screen/tiket_screen/component/invoice_screen_component/component/detail_transaksi_screen_component/component/detail_pesanan_component/component/detail_pesanan_info_component/detail_pesanan_info_component.dart';
import 'package:sustain_tour_mobile/screen/tiket_screen/component/invoice_screen_component/component/detail_transaksi_screen_component/component/detail_pesanan_component/component/status_pesanan_component/status_pesanan_component.dart';

class DetailPesananComponent extends StatelessWidget {
  final TicketData tiketData;
  const DetailPesananComponent({super.key, required this.tiketData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StatusPesananComponent(
          statusOrder: tiketData.statusOrder,
        ),
        const SizedBox(
          height: 24,
        ),
        DetailPesananInfoComponent(
          wisataName: tiketData.wisataName,
          jumlahTiketYangDibeli: tiketData.quantity,
          emisiCarbon: tiketData.carboonFootprint,
        )
      ],
    );
  }
}
