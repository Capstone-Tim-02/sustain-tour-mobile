import 'package:flutter/material.dart';

/// Sementara Belum Fix
class ShadowStyle {
  static BoxShadow primaryShadow = BoxShadow(
    color: Colors.black.withOpacity(0.1),
    spreadRadius: 2,
    blurRadius: 10,
    offset: const Offset(0, 4),
  );

  static BoxShadow secondaryShadow = BoxShadow(
    color: Colors.black.withOpacity(0.2),
    spreadRadius: 3,
    blurRadius: 15,
    offset: const Offset(0, 6),
  );
}
