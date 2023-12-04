import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:sustain_tour_mobile/models/wisata_models/wisata_models.dart';

import 'package:sustain_tour_mobile/screen/home_screen/components/detail_wisata_screen/detail_wisata_provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';

class DetailWisataScreen extends StatefulWidget {
  @override
  State<DetailWisataScreen> createState() => _DetailWisataScreenState();
}

class _DetailWisataScreenState extends State<DetailWisataScreen> {
  int currentImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final wisatadata = (ModalRoute.of(context)?.settings.arguments) as Wisata;
    LoginProvider loginProvider =
        Provider.of<LoginProvider>(context, listen: false);
    // Menggunakan ChangeNotifierProvider untuk mendapatkan DetailWisataProvider
    final detailProvider = Provider.of<DetailWisataProvider>(context);

    // Memanggil fungsi untuk mendapatkan detail wisata
    detailProvider.getDetailWisataById(
        wisatadata.id, loginProvider.token.toString());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Detail Wisata'),
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
                            // TODO: Lakukan sesuatu jika halaman berubah
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
                    style: const TextStyle(
                        fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(Assets.assetsIconsLocation),
                          const SizedBox(
                            width: 5,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: const Text("Carbon Emision"),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(Icons.fiber_manual_record, size: 5),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(detailWisata.totalCarbonFootprint.toString())
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(Assets.assetsIconsLocation),
                          const SizedBox(
                            width: 5,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: const Text("Open"),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(Icons.fiber_manual_record, size: 5),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(wisatadata.descriptionIsOpen)
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(Assets.assetsIconsLocation),
                          const SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: Text(
                              wisatadata.kota,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Highlight',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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
                                  const Text('•',
                                      style: TextStyle(fontSize: 16)),
                                  const SizedBox(width: 8),
                                  Expanded(child: Text(paragraph)),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Fasilitas',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  for (int i = 0; i < fasilitasList.length; i++)
                    Text('• ${fasilitasList[i]}',
                        style: const TextStyle(fontSize: 16)),
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
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentImageIndex == index ? Colors.blue : Colors.grey,
      ),
    );
  }
}
