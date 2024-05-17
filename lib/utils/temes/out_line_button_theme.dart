import 'package:admin_panel/utils/const/colors.dart';
import 'package:flutter/material.dart';

class EOutlineButtonTheme {
// static final lightOutButtonThemeData = OutlinedButtonThemeData(
//   style: OutlinedButton.styleFrom(
//     elevation: 0,
//     foregroundColor: Colors.black,
//     side:  const BorderSide(
//       color: Colors.blue,
//     ),
//     textStyle: const TextStyle(
//       fontSize: 16,
//       color: Colors.black,
//       fontWeight: FontWeight.w600,
//     ),
//     padding:  const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(14.0),
//     ),
//   )
// );

  static final darkOutButtonThemeData = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    elevation: 0,
    foregroundColor: AColors.primaryColor,
    side: const BorderSide(color: AColors.primaryColor),
    textStyle: const TextStyle(
      fontSize: 16,
      color: AColors.primaryColor,
      fontWeight: FontWeight.w600,
    ),
    padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  ));
}
