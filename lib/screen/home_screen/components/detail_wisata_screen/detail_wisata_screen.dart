import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sustain_tour_mobile/constants/assets_image.dart';
import 'package:sustain_tour_mobile/models/api/detail_wisata_byid_api.dart';
import 'package:sustain_tour_mobile/models/detail_wisata_byid_models/detail_wisata_byid_models.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailWisataScreen extends StatefulWidget {
  final int wisataId;
  final String userToken;

  const DetailWisataScreen({
    super.key,
    required this.wisataId,
    required this.userToken,
  });

  @override
  _DetailWisataScreenState createState() => _DetailWisataScreenState();
}

class _DetailWisataScreenState extends State<DetailWisataScreen> {
  late Future<DetailWisataByid> _futureDetailWisata;
  late DetailWisataApi _detailWisataApi;
  int _currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    _detailWisataApi = DetailWisataApi();
    _futureDetailWisata = _detailWisataApi.getDetailWisataById(
      widget.wisataId,
      widget.userToken,
    );
  }

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder<DetailWisataByid>(
        future: _futureDetailWisata,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data available'));
          } else {
            DetailWisataByid detailWisata = snapshot.data!;
            List<String> fasilitasList =
                parseFasilitasString(detailWisata.wisata.fasilitas);

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
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
                                  detailWisata.wisata.photoWisata2,
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
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentImageIndex = index;
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
                    detailWisata.wisata.title,
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
                              Text(detailWisata.wisata.descriptionIsOpen)
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
                              detailWisata.wisata.kota,
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
                          children: detailWisata.wisata.description
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
              ),
            );
          }
        },
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
        color: _currentImageIndex == index ? Colors.blue : Colors.grey,
      ),
    );
  }
}
