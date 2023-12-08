import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/constants/date_format_const.dart';
import 'package:sustain_tour_mobile/models/promo_models/promo_models.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/checkout_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/shadow_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/badge_widget.dart';
import 'package:sustain_tour_mobile/widget/snack_bar_widget.dart';

class UsePromoScreen extends StatelessWidget {
  const UsePromoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of<CheckoutProvider>(context, listen: false);
    return Scaffold(
      appBar:  AppBar(
        title: Text(
          'Pilih Promo',
          style: TextStyleWidget.titleT2(
            fontWeight: FontWeightStyle.semiBold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 28),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 44,
                      child: TextFormField(
                        controller: checkoutProvider.usePromoController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                          filled: true,
                          fillColor: ColorThemeStyle.grey50,
                          hintText: "Tempel kode disini",
                          hintStyle: TextStyleWidget.bodyB3(
                            color: ColorThemeStyle.black100,
                            fontWeight: FontWeight.w500
                          ),
                          border:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: ColorThemeStyle.blue100
                            )
                          )
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 17),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: ColorThemeStyle.blue100
                    ),
                    onPressed: (){
                      checkoutProvider.onUsePromo(checkoutProvider.usePromoController.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBarWidget.snackBarWidget(
                          message: checkoutProvider.message,
                          duration: const Duration(seconds: 2),
                          backgroundColor: checkoutProvider.isPromoUsed ? ColorThemeStyle.green100 : ColorThemeStyle.red
                        )
                      );
                    },
                    child: Text(
                      "Pakai",
                      style: TextStyleWidget.titleT2(
                        color: ColorThemeStyle.white100,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  )
                ],
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Promo tersedia",
                    style: TextStyleWidget.titleT2(
                      color: ColorThemeStyle.black100,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  Consumer<CheckoutProvider>(
                    builder: (context, checkoutProvider, child) {
                      return checkoutProvider.isPromoUsed
                        ? GestureDetector(
                            onTap: (){
                              checkoutProvider.onCancelPromo();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBarWidget.snackBarWidget(
                                  message: "Kode promo batal digunakan",
                                  backgroundColor: ColorThemeStyle.red,
                                  duration: const Duration(seconds: 2)
                                )
                              );
                            },
                            child: Text(
                              "Batalkan promo",
                              style: TextStyleWidget.titleT3(
                                color: ColorThemeStyle.red,
                                fontWeight: FontWeight.w500
                              ),
                            )
                          )
                        : const SizedBox();
                    }
                  )
                ],
              ),
              const SizedBox(height: 8),
              Consumer<CheckoutProvider>(
                builder: (context, checkoutProvider, child) {
                  return checkoutProvider.isLoadingPromo
                  ? const Center(child: CircularProgressIndicator())
                  : checkoutProvider.isGetPromoSuccess
                    ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: checkoutProvider.listAllPromo.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Promo promoItem = checkoutProvider.listAllPromo[index];
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: [ShadowStyle.shadowFix1]
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            margin: EdgeInsets.zero,
                            color: ColorThemeStyle.white100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  child: Text(
                                    promoItem.namaPromo,
                                    style: TextStyleWidget.bodyB2(
                                      color: ColorThemeStyle.black100,
                                      fontWeight: FontWeight.w600
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(
                                    "Berlaku hingga ${DateFormatConst.dateToTanggalHalfBulanTahunFormatNoKoma.format(promoItem.tanggalKadaluarsa)}",
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.4,
                                      height: 1.6,
                                      color: ColorThemeStyle.black100
                                    )
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)
                                    ),
                                    color: index == checkoutProvider.usedPromoIndex ? ColorThemeStyle.green100 : ColorThemeStyle.blue80
                                  ),
                                  padding: const EdgeInsets.only(left: 12, right: 14, top: 7, bottom: 7),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "KODE PROMO",
                                        style: TextStyleWidget.bodyB1(
                                          color: ColorThemeStyle.white100,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      index == checkoutProvider.usedPromoIndex
                                      ? Container(
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color:  ColorThemeStyle.white100,
                                            borderRadius: BorderRadius.circular(4)
                                          ),
                                          padding: const EdgeInsets.symmetric(horizontal: 8),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Terpakai",
                                                style: TextStyleWidget.bodyB1(
                                                  color: ColorThemeStyle.green100,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              const Icon(
                                                Icons.check,
                                                color: ColorThemeStyle.green100,
                                                size: 17,
                                              )
                                            ],
                                          ),
                                        )
                                      : GestureDetector(
                                        onTap: (){
                                          checkoutProvider.onCopyPromo(index);
                                          Clipboard.setData(
                                            ClipboardData(text: promoItem.kodeVoucher)).then((_){
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBarWidget.snackBarWidget(
                                                  message: "Berhasil menyalin kode promo",
                                                  duration: const Duration(seconds: 2)
                                                )
                                              );
                                          });
                                        },
                                        child: Container(
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: index == checkoutProvider.copyKodeIndex ? ColorThemeStyle.blue100 : ColorThemeStyle.white100,
                                            borderRadius: BorderRadius.circular(4)
                                          ),
                                          padding: const EdgeInsets.symmetric(horizontal: 8),
                                          child: Row(
                                            children: [
                                              Text(
                                                promoItem.kodeVoucher.length > 15
                                                ? promoItem.kodeVoucher.substring(0,15)
                                                : promoItem.kodeVoucher,
                                                style: TextStyleWidget.bodyB1(
                                                  color: index == checkoutProvider.copyKodeIndex ? ColorThemeStyle.white100 : ColorThemeStyle.black100,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              SvgPicture.asset(
                                                Assets.assetsIconsCopy,
                                                colorFilter: ColorFilter.mode(
                                                  index == checkoutProvider.copyKodeIndex ? ColorThemeStyle.white100 : ColorThemeStyle.black100,
                                                  BlendMode.srcIn
                                                ),
                                                width: 13,
                                                height: 13,
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            "Terjadi kesalahan!",
                            style: TextStyleWidget.titleT2(
                                fontWeight: FontWeight.w700,
                                color: ColorThemeStyle.red),
                          ),
                          const SizedBox(height: 16),
                          BadgeWidget.container(
                            onPressed: () {
                              checkoutProvider.getUserPromo();
                            },
                            label: "Muat ulang")
                        ],
                      );
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}