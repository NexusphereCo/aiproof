import 'package:flutter/material.dart';

class APColor {
  APColor._();

  static MaterialColor primary = const MaterialColor(
    // default = shade[500]
    0xFF19979C,
    <int, Color>{
      50: Color(0xFFF2F3FC),
      100: Color(0xFFB8DFE0),
      200: Color(0xFF95CFD1),
      300: Color(0xFF65B9BD),
      400: Color(0xFF47ACB0),
      500: Color(0xFF19979C),
      600: Color(0xFF17898E),
      700: Color(0xFF126B6F),
      800: Color(0xFF0E5356),
      900: Color(0xFF0B3F42),
    },
  );

  static MaterialColor secondary = const MaterialColor(
    // default = shade[500]
    0xFF154682,
    <int, Color>{
      50: Color(0xFFE8EDF3),
      100: Color(0xFFB6C6D8),
      200: Color(0xFF93AAC6),
      300: Color(0xFF6283AB),
      400: Color(0xFF446B9B),
      500: Color(0xFF154682),
      600: Color(0xFF134076),
      700: Color(0xFF0F325C),
      800: Color(0xFF0C2748),
      900: Color(0xFF091D37),
    },
  );

  static MaterialColor light = const MaterialColor(
    // default = shade[50]
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFE8E8E8),
      200: Color(0xFFB5B5B5),
      300: Color(0xFF8C8C8C),
      400: Color(0xFF6B6B6B),
    },
  );

  static MaterialColor dark = const MaterialColor(
    // default = shade[400]
    0xFF112629,
    <int, Color>{
      50: Color(0xFFB5BCBD),
      100: Color(0xFF929B9D),
      200: Color(0xFF606E70),
      300: Color(0xFF415154),
      400: Color(0xFF112629),
    },
  );

  static MaterialColor red = const MaterialColor(
    // default = shade[400]
    0xFFF64040,
    <int, Color>{
      50: Color(0xFFFFD7D7),
      100: Color(0xFFFFB9B9),
      200: Color(0xFFF99696),
      300: Color(0xFFF57070),
      400: Color(0xFFF64040),
    },
  );
}
