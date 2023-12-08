import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/constants/currency_format_const.dart';
import 'package:sustain_tour_mobile/constants/date_format_const.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';
import 'package:sustain_tour_mobile/models/checkout_models/checkout_argument_models.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/checkout_provider.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/components/booking_result_screen/booking_result_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/profile_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/shadow_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/button_widget.dart';
import 'package:sustain_tour_mobile/widget/snack_bar_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments) as CheckoutArgumentModel;
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    CheckoutProvider checkoutProvider = Provider.of<CheckoutProvider>(context, listen: false);
    BookingResultProvider bookingResultProvider = Provider.of<BookingResultProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: TextStyleWidget.titleT2(
            fontWeight: FontWeightStyle.semiBold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "Tanggal kunjungan",
                  style: TextStyleWidget.titleT2(
                    color: ColorThemeStyle.grey100,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Text(
                DateFormatConst.dateToTanggalBulanTahunFormat.format(arguments.checkinDate).toString(),
                style: TextStyleWidget.headlineH3(
                  color: ColorThemeStyle.black100,
                  fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      arguments.wisata.photoWisata1,
                      width: 83,
                      height: 86,
                      fit: BoxFit.fitHeight,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.image_not_supported);
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Text(
                          arguments.wisata.title,
                          style: TextStyleWidget.titleT2(
                            color: ColorThemeStyle.black100,
                            fontWeight: FontWeight.w600
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.location_pin, size: 12),
                          const SizedBox(width: 8),
                          Text(
                            arguments.wisata.kota.replaceAll('"', ''),
                            style: TextStyleWidget.bodyB3(
                              color: ColorThemeStyle.grey100,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Consumer<CheckoutProvider>(
                              builder: (context, checkoutProvider, child) {
                                return Row(
                                  children: [
                                    InkWell(
                                      customBorder: const CircleBorder(),
                                      onTap: (){
                                        checkoutProvider.decrementQuantity();
                                      },
                                      child: Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: checkoutProvider.quantity == 1 ? ColorThemeStyle.grey100 : ColorThemeStyle.blue100
                                        ),
                                        child: const Icon(
                                          Icons.remove,
                                          size: 20,
                                          color: ColorThemeStyle.white100
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                      child: Text(
                                        checkoutProvider.quantity.toString(),
                                        style: TextStyleWidget.bodyB3(
                                          color: ColorThemeStyle.black100,
                                          fontWeight: FontWeight.w500
                                        ),
                                        textAlign: TextAlign.center,
                                      )
                                    ),
                                    InkWell(
                                      customBorder: const CircleBorder(),
                                      onTap: (){
                                        checkoutProvider.incrementQuantity();
                                      },
                                      child: Container(
                                        width: 24,
                                        height: 24,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ColorThemeStyle.blue100
                                        ),
                                        child: const Icon(
                                          Icons.add,
                                          size: 19,
                                          color: ColorThemeStyle.white100
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            Text(
                              CurrencyFormatConst.convertToIdr(arguments.wisata.price.toDouble(),0),
                              style: TextStyleWidget.titleT2(
                                color: ColorThemeStyle.black100,
                                fontWeight: FontWeight.w600
                              ),
                            )
                          ]
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                "Promo",
                style: TextStyleWidget.titleT2(
                  color: ColorThemeStyle.black100,
                  fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: (){
                  Provider.of<CheckoutProvider>(context, listen: false).getUserPromo();
                  Navigator.pushNamed(
                    context,
                    Routes.usePromoScreen
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 72,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    boxShadow: [ShadowStyle.shadowFix1],
                    color: ColorThemeStyle.white100,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: ColorThemeStyle.blue100,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: SvgPicture.asset(
                              Assets.assetsIconsPromo,
                              width: 28,
                              height: 28,
                              colorFilter: const ColorFilter.mode(ColorThemeStyle.white100, BlendMode.srcIn),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Consumer<CheckoutProvider>(
                            builder: (context, checkoutProvider, child) {
                              return checkoutProvider.isPromoUsed
                                ? Center(
                                    child: Text(
                                      "1 Promo Digunakan",
                                      style: TextStyleWidget.titleT3(
                                        color: ColorThemeStyle.black100,
                                        fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  )
                                : Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Gunakan Promo",
                                        style: TextStyleWidget.titleT3(
                                          color: ColorThemeStyle.black100,
                                          fontWeight: FontWeight.w500
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        "pilih promo yang tersedia",
                                        style: TextStyleWidget.bodyB3(
                                          color: ColorThemeStyle.grey100,
                                          fontWeight: FontWeight.w500
                                        ),
                                      )
                                    ],
                                  );
                            },
                          )
                        ],
                      ),
                      const Icon(
                        Icons.navigate_next,
                        size: 24,
                        color: ColorThemeStyle.black100,
                      )
                    ]
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Poin",
                style: TextStyleWidget.titleT2(
                  color: ColorThemeStyle.black100,
                  fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: (){

                },
                child: Consumer<CheckoutProvider>(
                  builder: (context, checkoutProvider, child) {
                    return Container(
                      width: double.infinity,
                      height: 72,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        boxShadow: [ShadowStyle.shadowFix1],
                        color: checkoutProvider.isPointUsed ? ColorThemeStyle.blue100 : ColorThemeStyle.white100,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: checkoutProvider.isPointUsed ? ColorThemeStyle.white100 : ColorThemeStyle.blue100 ,
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                child: SvgPicture.asset(
                                  Assets.assetsIconsCoin,
                                  width: 28,
                                  height: 28,
                                  colorFilter: ColorFilter.mode(
                                    checkoutProvider.isPointUsed ? ColorThemeStyle.blue100 : ColorThemeStyle.white100,
                                    BlendMode.srcIn
                                  ),
                                )
                              ),
                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Gunakan Poinmu",
                                    style: TextStyleWidget.titleT3(
                                      color: checkoutProvider.isPointUsed ? ColorThemeStyle.white100 : ColorThemeStyle.black100,
                                      fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "${profileProvider.user.points.toString()} Poin",
                                    style: TextStyleWidget.bodyB3(
                                      color: checkoutProvider.isPointUsed ? ColorThemeStyle.white100 : ColorThemeStyle.grey100,
                                      fontWeight: FontWeight.w500
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Theme(
                            data: ThemeData(
                              useMaterial3: false
                            ),
                            child: Switch(
                              activeColor: ColorThemeStyle.blue40,
                              activeTrackColor: ColorThemeStyle.grey50,
                              inactiveThumbColor: ColorThemeStyle.grey100,
                              inactiveTrackColor: ColorThemeStyle.grey50,
                              value: checkoutProvider.isPointUsed,
                              onChanged: (bool value){
                                if(profileProvider.user.points == 0){
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBarWidget.snackBarWidget(
                                      message: "Kamu tidak memiliki poin!",
                                      duration: const Duration(seconds: 2),
                                      backgroundColor: ColorThemeStyle.red
                                    )
                                  );
                                } else {
                                  checkoutProvider.togglePoin(value);
                                }
                              }
                            ),
                          )
                        ]
                      ),
                    );
                  }
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Order Info",
                style: TextStyleWidget.titleT2(
                  color: ColorThemeStyle.black100,
                  fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 16),
              Consumer<CheckoutProvider>(
                builder:(context, checkoutProvider, child) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sub total",
                          style: TextStyleWidget.bodyB3(
                            color: ColorThemeStyle.black100,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          CurrencyFormatConst.convertToIdr((checkoutProvider.quantity * arguments.wisata.price),0),
                          style: TextStyleWidget.bodyB3(
                            color: ColorThemeStyle.black100,
                            fontWeight: FontWeight.w500
                          ),
                        )
                      ],
                    ),
                  );
                }
              ),
              Consumer<CheckoutProvider>(
                builder:(context, checkoutProvider, child) {
                  return checkoutProvider.isPromoUsed
                    ? Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Promo",
                              style: TextStyleWidget.bodyB3(
                                color: ColorThemeStyle.black100,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            Text(
                              "- ${CurrencyFormatConst.convertToIdr((
                                (checkoutProvider.discountPercentage / 100) *
                                checkoutProvider.quantity *
                                arguments.wisata.price),0)
                              }",
                              style: TextStyleWidget.bodyB3(
                                color: ColorThemeStyle.black100,
                                fontWeight: FontWeight.w500
                              ),
                            )
                          ],
                        ),
                    )
                    : const SizedBox();
                }
              ),
              Consumer<CheckoutProvider>(
                builder:(context, checkoutProvider, child) {
                  return checkoutProvider.isPointUsed
                  ? Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Desti Point",
                            style: TextStyleWidget.bodyB3(
                              color: ColorThemeStyle.black100,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          Text(
                            "- ${CurrencyFormatConst.convertToIdr((profileProvider.user.points * 1000),0)}",
                            style: TextStyleWidget.bodyB3(
                              color: ColorThemeStyle.black100,
                              fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      ),
                  )
                  : const SizedBox();
                }
              ),
              Consumer<CheckoutProvider>(
                builder: (context, checkoutProvider, child) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyleWidget.bodyB3(
                            color: ColorThemeStyle.black100,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          CurrencyFormatConst.convertToIdr((
                            (checkoutProvider.quantity * arguments.wisata.price) -
                            ((checkoutProvider.discountPercentage / 100) * arguments.wisata.price * checkoutProvider.quantity) -
                            (checkoutProvider.isPointUsed ? (profileProvider.user.points * 1000) : 0)
                          ),0),
                          style: TextStyleWidget.bodyB1(
                            color: ColorThemeStyle.blue100,
                            fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    ),
                  );
                }
              ),
              const SizedBox(height: 32),
              ButtonWidget.defaultContainer(
                text: "Booking Sekarang",
                textstyle: TextStyleWidget.headlineH3(
                  color: ColorThemeStyle.white100,
                  fontWeight: FontWeight.w600
                ),
                onPressed: (){
                  checkoutProvider.onBooking(
                    wisataId: arguments.wisata.id,
                    checkinBooking: arguments.checkinDate
                  );
                  bookingResultProvider.bookingResultProviderReset();
                  bookingResultProvider.bookingRequest(requestBody: checkoutProvider.requestBodyModel!);
                  Navigator.pushNamed(
                    context,
                    Routes.bookingResultScreen,
                  );
                }
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}