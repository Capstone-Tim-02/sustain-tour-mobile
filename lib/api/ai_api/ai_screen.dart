// import 'package:flutter/material.dart';
// import 'package:sustain_tour_mobile/api/ai_api/ai_api.dart';
// import 'package:sustain_tour_mobile/api/ai_api/result_screen.dart';
// import 'package:sustain_tour_mobile/models/ai_models/ai_models.dart';

// class HomeScreen2 extends StatefulWidget {
//   const HomeScreen2({super.key});

//   @override
//   State<HomeScreen2> createState() => _HomeScreen2State();
// }

// class _HomeScreen2State extends State<HomeScreen2> {
//   final TextEditingController _messageController = TextEditingController();

//   bool isLoading = false;
//   AiModels? gptResponseData;

//   void _getRecommendation() async {
//     setState(() {
//       isLoading = true;
//     });

//     try {
//       final result = await AiAPI.postDataWithAuthorization(
//           message: _messageController.text);

//       setState(() {
//         isLoading = false;
//         gptResponseData = result;
//       });

//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) {
//             return ResultScreen(
//               gptResponseData: result,
//               question: _messageController.text,
//             );
//           },
//         ),
//       );
//     } catch (e) {
//       final snackBar = SnackBar(
//         content: Text('Failed to send a request: $e'),
//       );

//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Personal Valorant Coach',
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: SingleChildScrollView(
//           reverse: true,
//           child: Form(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Center(
//                   child: Text(
//                     'Any question about valorant ?',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   'Your question',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.text,
//                   controller: _messageController,
//                   decoration: const InputDecoration(
//                     hintText: 'Give me duelist recommendations for Breeze map',
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.all(8),
//                   child: isLoading
//                       ? const Center(child: CircularProgressIndicator())
//                       : ElevatedButton(
//                           onPressed: _getRecommendation,
//                           child: const Center(
//                             child: Text('Search'),
//                           ),
//                         ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
