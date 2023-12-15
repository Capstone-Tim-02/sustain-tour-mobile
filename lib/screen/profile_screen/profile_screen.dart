import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sustain_tour_mobile/screen/login_screen/login_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/profile_emission_component.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/profile_emission_provider.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_option_component/profile_option_component.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_tile_component/profile_tile_component.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/profile_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async {
          ProfileProvider profileProvider =
              Provider.of<ProfileProvider>(context, listen: false);
          ProfileEmissionProvider profileEmisionProvider =
              Provider.of<ProfileEmissionProvider>(context, listen: false);

          LoginProvider loginProvider =
              Provider.of<LoginProvider>(context, listen: false);
          profileProvider.getUserData(
              userId: loginProvider.userId?.toInt() ?? 0);
          profileEmisionProvider.getUserEmission(
              userId: loginProvider.userId?.toInt() ?? 0);
        },
        child: ListView(
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
        ));
  }
}
