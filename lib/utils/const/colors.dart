import 'package:flutter/material.dart';

class AColors {
  static const Color primaryColor = Color(0xFF3F51B5);
  //background color
  static const Color backgroundColor = Colors.white;

//icon colors
//white

  //black
  //red
  static const Color iconColorBlack = Colors.black;
  //white
  static const Color iconColorWhite = Colors.white;
  //transparent
  static const Color iconPrimaryColor = Color(0xFF3F51B5);
  //purpleAccent

  //primary swatch MaterialColor white

// Define your primary color
  static MaterialColor myPrimaryColor = const MaterialColor(
    0xFF000000, // Black is the primary color
    <int, Color>{
      50: Color(0xFF000000), // 10% transparency
      100: Color(0xFF000000), // 20% transparency
      200: Color(0xFF000000), // 30% transparency
      300: Color(0xFF000000), // 40% transparency
      400: Color(0xFF000000), // 50% transparency
      500: Color(0xFF000000), // 60% transparency
      600: Color(0xFF000000), // 70% transparency
      700: Color(0xFF000000), // 80% transparency
      800: Color(0xFF000000), // 90% transparency
      900: Color(0xFF000000), // Full transparency
    },
  );

// Use the primary swatch in your app
}
