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
import 'package:sustain_tour_mobile/screen/checkout_screen/checkout_provider.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/detail_wisata_screen/carbon_footprint_byid_provider.dart';
import 'package:sustain_tour_mobile/screen/home_screen/components/detail_wisata_screen/detail_wisata_provider.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/badge_widget.dart';
import 'package:sustain_tour_mobile/widget/button_widget.dart';
import 'package:sustain_tour_mobile/widget/google_maps_widget.dart';
import 'package:sustain_tour_mobile/widget/widget_youtube_player.dart';

class DetailWisataScreen extends StatefulWidget {
  const DetailWisataScreen({Key? key}) : super(key: key);
  @override
  State<DetailWisataScreen> createState() => _DetailWisataScreenState();
}

class _DetailWisataScreenState extends State<DetailWisataScreen> {
  int currentImageIndex = 0;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final totalcarbon =
        Provider.of<CarbonEmissionProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Wisata',
          style: TextStyleWidget.titleT2(fontWeight: FontWeightStyle.semiBold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Consumer<DetailWisataProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const Column(
                children: [
                  Center(child: CircularProgressIndicator()),
                ],
              );
            } else {
              final detailWisata = provider.detailWisata!;

              List<String> fasilitasList =
                  parseFasilitasString(detailWisata.wisata.fasilitas);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
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
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: YoutubePlayerWidget(
                                linkVid: detailWisata.wisata.videoLink,
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
                                    detailWisata.wisata.photoWisata1),
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
                                    detailWisata.wisata.photoWisata2),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: NetworkImage(
                                    detailWisata.wisata.photoWisata3),
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
                            4,
                            (index) => buildIndicator(index),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    detailWisata.wisata.title,
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
                                totalcarbon.totalCarbonFootprint.toString(),
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
                                detailWisata.wisata.descriptionIsOpen,
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
                              detailWisata.wisata.kota,
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
                          children: detailWisata.wisata.description
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
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return SingleChildScrollView(
                                            child: Container(
                                              padding: const EdgeInsets.all(24),
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(40)),
                                              ),
                                              width: double.infinity,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 157,
                                                        height: 5,
                                                        margin: const EdgeInsets
                                                            .only(
                                                            top: 10,
                                                            bottom: 20),
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: ColorThemeStyle
                                                              .grey80,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          4)),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Text(
                                                    'Carbon Emission Footprint',
                                                    style:
                                                        TextStyleWidget.titleT2(
                                                      color: ColorThemeStyle
                                                          .black100,
                                                      fontWeight:
                                                          FontWeightStyle
                                                              .semiBold,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 36,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Apa itu Carbon Emission Footprint?',
                                                        style: TextStyleWidget
                                                            .bodyB1(
                                                          color: ColorThemeStyle
                                                              .black100,
                                                          fontWeight:
                                                              FontWeightStyle
                                                                  .semiBold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 16,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 6),
                                                            child: Icon(
                                                              Icons
                                                                  .fiber_manual_record,
                                                              size: 5,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              'Carbon emission footprint adalah ukuran seberapa banyak kita berkontribusi terhadap perubahan iklim. Saat melakukan kegiatan atau beraktivitas, kita melepaskan gas rumah kaca ke atmosfer. Gas-gas ini menyebabkan atmosfer memanas, yang dapat menyebabkan berbagai permasalahan. Mengurangi jejak karbon dapat dengan melakukan hal-hal sederhana, seperti menggunakan transportasi umum.',
                                                              style:
                                                                  TextStyleWidget
                                                                      .bodyB3(
                                                                color:
                                                                    ColorThemeStyle
                                                                        .black100,
                                                                fontWeight:
                                                                    FontWeightStyle
                                                                        .regular,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 32,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Total Carbon Emission Footprint',
                                                        style: TextStyleWidget
                                                            .bodyB1(
                                                          color: ColorThemeStyle
                                                              .black100,
                                                          fontWeight:
                                                              FontWeightStyle
                                                                  .semiBold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 16,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 6),
                                                            child: Icon(
                                                              Icons
                                                                  .fiber_manual_record,
                                                              size: 5,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              'Total carbon footprint adalah jumlah emisi gas rumah kaca yang dihasilkan oleh suatu kegiatan atau aktivitas. Jumlah emisi gas tersebut nantinya akan dikonversi ke satuan ekuivalen CO2e untuk memudahkan perbandingan dan perhitungan ',
                                                              style:
                                                                  TextStyleWidget
                                                                      .bodyB3(
                                                                color:
                                                                    ColorThemeStyle
                                                                        .black100,
                                                                fontWeight:
                                                                    FontWeightStyle
                                                                        .regular,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 16,
                                                      ),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 6),
                                                            child: Icon(
                                                              Icons
                                                                  .fiber_manual_record,
                                                              size: 5,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              'Total Carbon Emmision destinasi ini setara dengan ${totalcarbon.totalCarbonFootprint}',
                                                              style:
                                                                  TextStyleWidget
                                                                      .bodyB3(
                                                                color:
                                                                    ColorThemeStyle
                                                                        .black100,
                                                                fontWeight:
                                                                    FontWeightStyle
                                                                        .regular,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Text(
                                      'Lihat Selengkapnya',
                                      style: TextStyleWidget.labelL2(
                                          fontWeight: FontWeightStyle.medium,
                                          color: ColorThemeStyle
                                              .greenSelengkapnya),
                                    ),
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
                      latTarget: detailWisata.wisata.lat,
                      longTarget: detailWisata.wisata.long),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    detailWisata.wisata.location,
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
                          context: context,
                          mapsLink: detailWisata.wisata.mapsLink);
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
                                  DateFormat("EEE", 'ID_id')
                                      .format(currentDate),
                                  style: TextStyleWidget.bodyB3(
                                    fontWeight: FontWeightStyle.semiBold,
                                    color: currentDate.day == selectedDate.day
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                Text(
                                  DateFormatConst.dateToTanggalHalfBulanFormat
                                      .format(currentDate),
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
                            CurrencyFormatConst.convertToIdr(
                                detailWisata.wisata.price, 0),
                            style: TextStyleWidget.headlineH3(
                              fontWeight: FontWeightStyle.semiBold,
                            ),
                          )
                        ],
                      ),
                      ButtonWidget.smallContainer(
                          text: 'Beli',
                          onPressed: () {
                            Provider.of<CheckoutProvider>(context,
                                    listen: false)
                                .checkoutProviderReset();
                            Navigator.pushNamed(context, Routes.checkoutScreen,
                                arguments: CheckoutArgumentModel(
                                    checkinDate: selectedDate,
                                    wisata: detailWisata.wisata));
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
