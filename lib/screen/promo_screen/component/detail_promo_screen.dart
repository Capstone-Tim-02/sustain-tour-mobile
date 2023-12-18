import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/screen/promo_screen/component/detail_promo_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/snack_bar_widget.dart';

class DetailPromoScreen extends StatelessWidget {
  final int promoId;
  const DetailPromoScreen({super.key, required this.promoId});

  @override
  Widget build(BuildContext context) {
    final detailPromoProvider = context.read<DetailPromoProvider>();
    detailPromoProvider.getDetailPromo(promoId);
    List<String> list = [
      "Buka aplikasi Destimate, pastikan sudah login ke akun",
      "Pilih halaman promo",
      "Pilih promo yang diinginkan, ketuk atau klik pada promo tersebut untuk menunjukan detailnya.",
      "Salin kode promo yang akan digunakan",
      "Tempel kode promo pada halaman checkout atau pembayaran",
      "Pastikan promo telah diterapkan, jika sesuai, lanjutkan transaksi dengan mengisi detail pembayaran",
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Promo',
          style: TextStyleWidget.titleT2(
            color: ColorThemeStyle.black100,
            fontWeight: FontWeightStyle.semiBold,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<DetailPromoProvider>(
        builder: (context, promoProvider, child) {
          if (promoProvider.isLoadingDetailPromo) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final detailPromoData = promoProvider.detailPromoData?.promo;
            final tanggalIndo = DateFormat('dd MMM yyyy', 'id_ID').format(
              detailPromoData?.tanggalKadaluarsa ?? DateTime.now(),
            );

            if (!promoProvider.isErrorDetailPromo && detailPromoData != null) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: SizedBox(
                          height: 164,
                          width: 380,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              detailPromoData.imageVoucher ?? "",
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                    Icons.image_not_supported_sharp,
                                    size: 60);
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        detailPromoData.title ?? '-',
                        style: TextStyleWidget.titleT2(
                          color: ColorThemeStyle.black100,
                          fontWeight: FontWeightStyle.semiBold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        detailPromoData.deskripsi ?? '-',
                        style: TextStyleWidget.bodyB3(
                          color: ColorThemeStyle.black100,
                          fontWeight: FontWeightStyle.regular,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Icon(Icons.today_rounded, size: 22),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Berlaku Hingga ',
                                  style: TextStyleWidget.labelL3(
                                    color: ColorThemeStyle.black100,
                                    fontWeight: FontWeightStyle.regular,
                                  ),
                                ),
                                TextSpan(
                                  text: tanggalIndo,
                                  style: TextStyleWidget.labelL3(
                                    color: ColorThemeStyle.black100,
                                    fontWeight: FontWeightStyle.semiBold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Kode Promo',
                        style: TextStyleWidget.titleT3(
                          color: ColorThemeStyle.black100,
                          fontWeight: FontWeightStyle.semiBold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        height: 66,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ColorThemeStyle.black100.withOpacity(0.05),
                        ),
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.only(bottom: 14, right: 8),
                          title: Center(
                            child: Text(
                              detailPromoData.kodeVoucher ?? "-",
                              style: TextStyleWidget.headlineH3(
                                color: ColorThemeStyle.black100,
                                fontWeight: FontWeightStyle.semiBold,
                              ),
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              Clipboard.setData(
                                ClipboardData(
                                    text: detailPromoData.kodeVoucher ?? "-"),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBarWidget.snackBarWidget(
                                    message: 'Kode berhasil disalin'),
                              );
                            },
                            icon: const Icon(Icons.copy_rounded, size: 24),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 216,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cara Pemakaian',
                              style: TextStyleWidget.titleT3(
                                color: ColorThemeStyle.black100,
                                fontWeight: FontWeightStyle.semiBold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Expanded(
                              child: ListView.builder(
                                itemCount: list.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Text(
                                    ('${index + 1}. ${list[index]}'),
                                    style: TextStyleWidget.labelL3(
                                      color: ColorThemeStyle.black100,
                                      fontWeight: FontWeightStyle.regular,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.assetsImagesNotFoundWisata),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70.0),
                    child: Text(
                      'Upss maaf, promo ini telah berakhir',
                      textAlign: TextAlign.center,
                      style: TextStyleWidget.bodyB2(
                        fontWeight: FontWeightStyle.medium,
                        color: ColorThemeStyle.grey100,
                      ),
                    ),
                  ),
                ],
              );
            }
          }
        },
      ),
    );
  }
}
