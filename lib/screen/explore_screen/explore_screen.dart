import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';
import 'package:sustain_tour_mobile/widget/badge_widget.dart';
import 'package:sustain_tour_mobile/widget/card_widget.dart';
import 'package:sustain_tour_mobile/widget/text_field_widget.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    List<bool> isButtonSelected = [false,false,false,false,false];
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(
                "Explore",
                style: TextStyleWidget.titleT2(
                  color: ColorThemeStyle.black100,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),

            //TODO : Menunggu Search Local Component

            //TODO : Logic toggle button
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  for(int i=0;i<5;i++)
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: isButtonSelected[i] ?
                      BadgeWidget.container(
                        onPressed: (){
                          print('Button Pressed disable!');
                          setState(() {
                            isButtonSelected[i] = false;
                          });
                        }
                      ) :
                      BadgeWidget.outline(
                        onPressed: (){
                          print('Button Pressed enable!');
                          setState(() {
                            isButtonSelected[i] = true;
                          });
                        }
                      ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8
              ),
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return CardWidget.small(
                  imageUrl: "https://upload.wikimedia.org/wikipedia/commons/e/e1/Pemandangan_Gunung_Bromo.jpg",
                  title: "Wisata alam",
                  location: "Surabaya",
                  subtitle: "Rp 200.000"
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}