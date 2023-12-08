import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:sustain_tour_mobile/constants/currency_format_const.dart';
import 'package:sustain_tour_mobile/constants/date_format_const.dart';
import 'package:sustain_tour_mobile/constants/open_maps_func.dart';
import 'package:sustain_tour_mobile/constants/routes.dart';
import 'package:sustain_tour_mobile/models/checkout_models/checkout_argument_models.dart';
import 'package:sustain_tour_mobile/models/wisata_models/wisata_models.dart';
import 'package:sustain_tour_mobile/screen/checkout_screen/checkout_provider.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/detail_wisata_screen/detail_wisata_provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/badge_widget.dart';
import 'package:sustain_tour_mobile/widget/button_widget.dart';
import 'package:sustain_tour_mobile/widget/google_maps_widget.dart';

class DetailWisataScreen extends StatefulWidget {
  @override
  State<DetailWisataScreen> createState() => _DetailWisataScreenState();
}

class _DetailWisataScreenState extends State<DetailWisataScreen> {
  int currentImageIndex = 0;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final wisatadata = (ModalRoute.of(context)?.settings.arguments) as Wisata;
    LoginProvider loginProvider =
        Provider.of<LoginProvider>(context, listen: false);
    final detailProvider = Provider.of<DetailWisataProvider>(context);
    detailProvider.getDetailWisataById(
        wisatadata.id, loginProvider.token.toString());
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<DetailWisataProvider>(
          builder: (context, provider, child) {
            if (provider.detailWisata == null) {
              // Menampilkan loading jika data belum diterima
              return const Center(child: CircularProgressIndicator());
            } else {
              // Menampilkan detail wisata setelah diterima
              final detailWisata = provider.detailWisata!;
              List<String> fasilitasList =
                  parseFasilitasString(wisatadata.fasilitas);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      Text(
                        'Detail Wisata',
                        style: TextStyleWidget.titleT2(
                            fontWeight: FontWeightStyle.semiBold),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      CarouselSlider(
                        items: [
                          Container(
                            margin: const EdgeInsets.all(5),
                            width: 380,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: NetworkImage(wisatadata.photoWisata1),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            width: 380,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: NetworkImage(
                                  wisatadata.photoWisata2,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: NetworkImage(wisatadata.photoWisata3),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                        options: CarouselOptions(
                          height: 200,
                          initialPage: 0,
                          reverse: false,
                          viewportFraction: 1.0,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentImageIndex = index;
                            });
                          },
                        ),
                      ),
                      Positioned(
                        top: 180,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            3,
                            (index) => buildIndicator(index),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    wisatadata.title,
                    style: TextStyleWidget.headlineH3(
                        fontWeight: FontWeightStyle.semiBold),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(Assets.assetsIconCarbonCloud),
                          const SizedBox(
                            width: 5,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "Carbon Emision",
                                  style: TextStyleWidget.bodyB3(
                                      fontWeight: FontWeightStyle.semiBold,
                                      color: ColorThemeStyle.greenCarbon),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(Icons.fiber_manual_record, size: 5),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                detailWisata.totalCarbonFootprint.toString(),
                                style: TextStyleWidget.bodyB3(
                                    fontWeight: FontWeightStyle.semiBold,
                                    color: ColorThemeStyle.greenCarbon),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(Assets.assetsIconsClock),
                          const SizedBox(
                            width: 5,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "Open",
                                  style: TextStyleWidget.bodyB3(
                                    fontWeight: FontWeightStyle.semiBold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(Icons.fiber_manual_record, size: 5),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                wisatadata.descriptionIsOpen,
                                style: TextStyleWidget.bodyB3(
                                  fontWeight: FontWeightStyle.semiBold,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(Assets.assetsIconMiLocation),
                          const SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: Text(
                              wisatadata.kota,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyleWidget.bodyB3(
                                fontWeight: FontWeightStyle.semiBold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Highlight',
                    style: TextStyleWidget.titleT2(
                      fontWeight: FontWeightStyle.semiBold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: wisatadata.description
                              .split('\n')
                              .map((paragraph) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '•',
                                    style: TextStyleWidget.bodyB3(
                                      fontWeight: FontWeightStyle.regular,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                      child: Text(
                                    paragraph,
                                    style: TextStyleWidget.bodyB3(
                                      fontWeight: FontWeightStyle.regular,
                                    ),
                                  )),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Fasilitas Lokal',
                    style: TextStyleWidget.titleT2(
                      fontWeight: FontWeightStyle.semiBold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  for (int i = 0; i < fasilitasList.length; i++)
                    Text(
                      '• ${fasilitasList[i]}',
                      style: TextStyleWidget.bodyB3(
                        fontWeight: FontWeightStyle.regular,
                      ),
                    ),
                  const SizedBox(height: 32),
                  Container(
                    height: 141,
                    width: 380,
                    decoration: BoxDecoration(
                        color: ColorThemeStyle.greenFLowkit,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 14, left: 17),
                              child: Text(
                                'Carbon Emission',
                                style: TextStyleWidget.headlineH3(
                                    fontWeight: FontWeightStyle.semiBold,
                                    color: ColorThemeStyle.white100),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 17),
                              child: Text(
                                'Informasi lengkap mengenai \nemisi karbon dan karbon yang \ndihasilkan dari wisata ini',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: TextStyleWidget.labelL2(
                                    fontWeight: FontWeightStyle.medium,
                                    color: ColorThemeStyle.white100),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 17),
                              child: Row(
                                children: [
                                  Text(
                                    'Lihat Selengkapnya',
                                    style: TextStyleWidget.labelL2(
                                        fontWeight: FontWeightStyle.medium,
                                        color:
                                            ColorThemeStyle.greenSelengkapnya),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(Icons.arrow_forward)
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 4, bottom: 2),
                          margin: const EdgeInsets.only(
                            top: 27,
                          ),
                          child: Image.asset(
                              Assets.assetsImaagesIllustratrionDetaiWisata),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  GoogleMapsWidget(
                      latTarget: wisatadata.lat, longTarget: wisatadata.long),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    wisatadata.location,
                    style: TextStyleWidget.bodyB3(
                      fontWeight: FontWeightStyle.regular,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  BadgeWidget.outline(
                    width: double.infinity,
                    label: 'Buka Maps',
                    fontWeight: FontWeightStyle.semiBold,
                    onPressed: () {
                      OpenMapsFunc.openMaps(
                          context: context, mapsLink: wisatadata.mapsLink);
                    },
                  ),
                  const Divider(),
                  Text(
                    'Pesan Tiket',
                    style: TextStyleWidget.titleT2(
                      fontWeight: FontWeightStyle.semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        final currentDate =
                            DateTime.now().add(Duration(days: index));

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDate = currentDate;
                            });
                          },
                          child: Container(
                            width: 100,
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: currentDate.day == selectedDate.day
                                  ? ColorThemeStyle.blue100
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: currentDate.day == selectedDate.day
                                    ? ColorThemeStyle.blue100
                                    : ColorThemeStyle.blue100,
                                width: 3,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  DateFormat('EEE').format(currentDate),
                                  style: TextStyleWidget.bodyB3(
                                    fontWeight: FontWeightStyle.semiBold,
                                    color: currentDate.day == selectedDate.day
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                Text(
                                  DateFormatConst.dateToTanggalHalfBulanFormat.format(currentDate),
                                  style: TextStyleWidget.bodyB2(
                                    fontWeight: FontWeightStyle.medium,
                                    color: currentDate.day == selectedDate.day
                                        ? Colors.white
                                        : ColorThemeStyle.grey80,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Harga',
                            style: TextStyleWidget.titleT1(
                                fontWeight: FontWeightStyle.semiBold,
                                color: ColorThemeStyle.grey80),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            CurrencyFormatConst.convertToIdr(wisatadata.price,0),
                            style: TextStyleWidget.headlineH3(
                              fontWeight: FontWeightStyle.semiBold,
                            ),
                          )
                        ],
                      ),
                      ButtonWidget.smallContainer(
                          text: 'Beli',
                          onPressed: () {
                            Provider.of<CheckoutProvider>(context, listen: false).checkoutProviderReset();
                            Navigator.pushNamed(context, Routes.checkoutScreen,
                                arguments: CheckoutArgumentModel(
                                  checkinDate: selectedDate,
                                  wisata: wisatadata
                                ));
                          })
                    ],
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }

  List<String> parseFasilitasString(String fasilitasString) {
    List<String> fasilitasList = [];

    try {
      fasilitasString = fasilitasString
          .replaceAll(
            '[',
            '',
          )
          .replaceAll(']', '');
      fasilitasString = fasilitasString
          .replaceAll(
            '"',
            '',
          )
          .replaceAll('"', '');

      fasilitasList = fasilitasString.split(', ').map((e) => e.trim()).toList();
    } catch (e) {
      print('Error parsing fasilitas string: $e');
    }

    return fasilitasList;
  }

  Widget buildIndicator(int index) {
    return Container(
      width: 8.0,
      height: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentImageIndex == index ? Colors.blue : Colors.grey,
      ),
    );
  }
}
