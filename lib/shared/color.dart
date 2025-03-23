import 'package:flutter/material.dart';

class WizhColor {
  /// Support
  static const Color pearlBush = Color(0xFFE9E1D8);
  static const Color springWood = Color(0xFFF8F5F2);
  static const Color eerieBlack = Color(0xFF242019);
  static const Color isabelline = Color(0xFFF8F5F2);
  static const Color whiteSmoke = Color(0xFFF7F5F3);
  static const Color beaver = Color(0xFF8E7A67);
  static const Color taupe = Color(0xFF4C3D2F);

  // GRADIENT

  static LinearGradient gradientLinearBg = LinearGradient(
    colors: [Color(0xFFA3947B), Color(0xFF988571), Color(0xFFF7F5F3)],
    stops: [0, 0.5, 1],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
