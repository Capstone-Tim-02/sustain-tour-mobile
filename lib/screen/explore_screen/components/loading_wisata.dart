import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/explore_screen/explore_screen_provider.dart';

class LoadingWisata extends StatelessWidget {
  const LoadingWisata({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExploreScreenProvider>(
      builder: (context, exploreScreenProvider, child) {
        return exploreScreenProvider.hasMoreWisata
          ? const Padding(
              padding: EdgeInsets.all(30),
              child: Center(child: CircularProgressIndicator()),
            )
          : const SizedBox(height: 40);
      }
    );
  }
}