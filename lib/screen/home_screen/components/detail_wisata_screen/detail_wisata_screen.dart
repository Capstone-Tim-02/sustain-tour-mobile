import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/api/detail_wisata_byid_api.dart';
import 'package:sustain_tour_mobile/models/detail_wisata_byid_models/detail_wisata_byid_models.dart';

class DetailWisataScreen extends StatefulWidget {
  final int wisataId;
  final String userToken;

  DetailWisataScreen({
    required this.wisataId,
    required this.userToken,
  });

  @override
  _DetailWisataScreenState createState() => _DetailWisataScreenState();
}

class _DetailWisataScreenState extends State<DetailWisataScreen> {
  late Future<DetailWisataByid> _futureDetailWisata;
  late DetailWisataApi _detailWisataApi;

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
        title: const Text('Detail Wisata'),
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
                  Image.network(detailWisata.wisata.photoWisata2),
                  const SizedBox(height: 16.0),
                  Text(
                    detailWisata.wisata.title,
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    detailWisata.wisata.location,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    detailWisata.wisata.description,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Fasilitas:',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  // Menampilkan data fasilitas dalam bentuk list
                  for (int i = 0; i < fasilitasList.length; i++)
                    ListTile(
                      title: Text('· ${fasilitasList[i]}'),
                    ),
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
}
