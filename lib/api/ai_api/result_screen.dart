import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/models/ai_models/ai_models.dart';

class ResultScreen extends StatelessWidget {
  final AiModels gptResponseData;
  final String question;

  const ResultScreen(
      {super.key, required this.gptResponseData, required this.question});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solution'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // const Padding(
          //   padding: EdgeInsets.all(16),
          //   child: Text(
          //     'Solution for your question',
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          Text(question),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            color: Colors.amberAccent,
            child: Text(
              gptResponseData.data.toString(),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
