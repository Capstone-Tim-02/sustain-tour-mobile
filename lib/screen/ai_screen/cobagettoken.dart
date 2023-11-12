import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/api/ai_api/ai_api.dart';
import 'package:sustain_tour_mobile/models/ai_models/ai_models.dart';

class GetData extends StatefulWidget {
  const GetData({Key? key}) : super(key: key);

  @override
  _GetDataState createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  String responseStatus = '';
  String responseData = '';

  Future<void> _onElevatedButtonPressed() async {
    String? token = await TokenManager.getToken();

    if (token != null) {
      print('Token: $token');
      // Handle further actions with the token if needed
    } else {
      print('Token not found.');
      // Handle case when token is not available
    }
  }

  Future<void> _onPostDataPressed() async {
    try {
      AiModels aiModels = await AiAPI.postDataWithAuthorization(
          message: 'Saya butuh rekomendasi Wisata di bali');
      setState(() {
        responseStatus = 'Response Status: ${aiModels.status}';
        responseData = 'Response Data: ${aiModels.data}';
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Token Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _onElevatedButtonPressed();
              },
              child: Text('Get Token'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _onPostDataPressed();
              },
              child: Text('Post Data with Authorization'),
            ),
            SizedBox(height: 20),
            Text(responseStatus),
            Container(
              color: Colors.amberAccent,
              child: Text(responseData),
            ),
          ],
        ),
      ),
    );
  }
}
