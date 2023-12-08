import 'package:flutter/material.dart';
import 'package:sustain_tour_mobile/constants/currency_format_const.dart';
import 'package:sustain_tour_mobile/style/color_theme_style.dart';
import 'package:sustain_tour_mobile/style/shadow_style.dart';
import 'package:sustain_tour_mobile/style/text_style_widget.dart';

class CardWidget {
  static Container small({
    String? title,
    int? price,
    String? location,
    String? imageUrl,
  }) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [ShadowStyle.shadowFix1],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          width: 182,
          height: 188,
          color: ColorThemeStyle.white100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Stack(children: [
                  Center(
                    child: SizedBox(
                      height: 146,
                      child:
                          Image.network(imageUrl ?? "", fit: BoxFit.fitHeight,
                              errorBuilder: (context, error, stackTrace) {
                        return const Center(
                            child: Icon(Icons.image_not_supported_sharp,
                                size: 60));
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Container(
                      height: 20,
                      decoration: BoxDecoration(
                          color: ColorThemeStyle.white100,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Icon(Icons.location_pin, size: 10),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 4, right: 6, top: 2, bottom: 2),
                            child: Text(
                              location ?? "Malang",
                              style: const TextStyle(
                                  color: ColorThemeStyle.black100,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.4,
                                  height: 2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 11, bottom: 2, right: 11, top: 2),
                      child: Text(
                        title ?? "Title",
                        style: TextStyleWidget.titleT3(
                            color: ColorThemeStyle.black100,
                            fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 11),
                      child: Text(
                        CurrencyFormatConst.convertToIdr(price?.toDouble(),0),
                        style: TextStyleWidget.bodyB3(
                            color: ColorThemeStyle.black100,
                            fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Container medium({
    String? title,
    String? imageUrl,
  }) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [ShadowStyle.shadowFix2],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          width: 246,
          height: 122,
          color: ColorThemeStyle.white100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 90,
                width: double.infinity,
                child: Image.network(imageUrl ?? "", fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image_not_supported_sharp, size: 60);
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  title ?? "Title",
                  style: TextStyleWidget.bodyB3(
                      color: ColorThemeStyle.black100,
                      fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Container mediumWithImage(
      {String? title, String? subtitle, String? imageUrl, int? price}) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [ShadowStyle.shadowFix1],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          width: 380,
          height: 112,
          color: ColorThemeStyle.white100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 8, right: 15, top: 8, bottom: 8),
                child: SizedBox(
                  height: 96,
                  width: 124,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(imageUrl ?? "", fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.image_not_supported_sharp,
                          size: 60);
                    }),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      title ?? "Title",
                      style: TextStyleWidget.titleT2(
                          color: ColorThemeStyle.black100,
                          fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    subtitle ?? "Subtitle",
                    style: TextStyleWidget.bodyB3(
                        color: ColorThemeStyle.grey100,
                        fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    CurrencyFormatConst.convertToIdr(price?.toDouble(),0),
                    style: TextStyleWidget.titleT2(
                        color: ColorThemeStyle.black100,
                        fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Container large({
    String? title,
    String? subtitle,
    String? imageUrl,
  }) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [ShadowStyle.shadowFix1],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          width: 380,
          height: 224,
          color: ColorThemeStyle.white100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 164,
                  width: 380,
                  child: Image.network(imageUrl ?? "", fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.image_not_supported_sharp,
                        size: 60);
                  }),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8, left: 8, right: 8),
                    child: Text(
                      title ?? "Title",
                      style: TextStyleWidget.titleT2(
                          color: ColorThemeStyle.black100,
                          fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 12),
                    child: Text(
                      subtitle ?? "Subtitle",
                      style: TextStyleWidget.labelL3(
                          color: ColorThemeStyle.grey100,
                          fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
