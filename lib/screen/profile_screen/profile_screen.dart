import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/profile_emission_component.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_option_component/profile_option_component.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_tile_component/profile_tile_component.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SizedBox(
          height: 32,
        ),
        ProfileTileComponent(),
        SizedBox(
          height: 24,
        ),
        ProfileEmissionComponent(),
        SizedBox(
          height: 24,
        ),
        ProfileOptionComponent(),
      ],
    );
  }
}
