import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF042991); // Main blue from the logo

  static const Map<int, Color> colorShades = {
    50: Color.fromRGBO(4, 41, 145, .1),
    100: Color.fromRGBO(4, 41, 145, .2),
    200: Color.fromRGBO(4, 41, 145, .3),
    300: Color.fromRGBO(4, 41, 145, .4),
    400: Color.fromRGBO(4, 41, 145, .5),
    500: Color.fromRGBO(4, 41, 145, .6),
    600: Color.fromRGBO(4, 41, 145, .7),
    700: Color.fromRGBO(4, 41, 145, .8),
    800: Color.fromRGBO(4, 41, 145, .9),
    900: Color.fromRGBO(4, 41, 145, 1),
  };

  static const MaterialColor primarySwatch = MaterialColor(0xFF042991, colorShades);

  static const Color secondaryColor = Color(0xFF00358A); // Slightly darker blue

  // System colors based on typical UI needs
  static const Color systemBlue = Color(0xFF007AFF); // A bright blue often used in iOS
  static const Color systemRed = Color(0xFFFF3B30);
  static const Color systemGreen = Color(0xFF34C759);

  // Neutral colors
  static const Color neutral1 = Color(0xFFF5F5F5); // Light grey
  static const Color neutral2 = Color(0xFFE0E0E0); // Medium grey
  static const Color neutral3 = Color(0xFF9E9E9E); // Dark grey
  static const Color neutral4 = Color(0xFF616161); // Darker grey
  static const Color neutral5 = Color(0xFF333333); // Darkest grey
}
