import 'package:flutter/material.dart';

class ShadowStyle {
  static BoxShadow shadowFix1 = BoxShadow(
    color: Colors.black.withOpacity(0.18),
    spreadRadius: 0,
    blurRadius: 10,
    offset: const Offset(0, 0),
  );

  static BoxShadow shadowFix2 = BoxShadow(
    color: Colors.black.withOpacity(0.1),
    spreadRadius: 0,
    blurRadius: 10,
    offset: const Offset(0, 4),
  );
}
