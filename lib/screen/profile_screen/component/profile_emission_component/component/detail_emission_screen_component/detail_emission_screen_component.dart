import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/screen/profile_screen/component/profile_emission_component/component/detail_emission_screen_component/component/detail_emission_component.dart/detail_emission_component.dart';
import 'package:sustain_tour_mobile/style/font_weight_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class DetailEmissionScreenComponent extends StatelessWidget {
  const DetailEmissionScreenComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Emisi Carbon',
          style: TextStyleWidget.titleT2(
            fontWeight: FontWeightStyle.semiBold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            const DetailEmissionComponent(),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Riwayat Kunjungan',
              style: TextStyleWidget.titleT2(
                fontWeight: FontWeightStyle.semiBold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 81,
                      width: double.infinity,
                      margin: const EdgeInsets.only(
                        bottom: 16,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Colors.black.withOpacity(0.18),
                            )
                          ]),
                      child: Text('tes'),
                    );
                  }),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
