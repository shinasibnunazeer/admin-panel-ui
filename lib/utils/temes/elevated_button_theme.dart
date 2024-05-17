import 'package:admin_panel/utils/const/colors.dart';
import 'package:flutter/material.dart';

class EElevatedButtonTeme {
  static final lightElevatedButtonThemeData = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: AColors.primaryColor,
          disabledBackgroundColor: Colors.grey,
          disabledForegroundColor: Colors.grey,
          side: const BorderSide(
            color: AColors.primaryColor,
          ),
          padding: const EdgeInsets.symmetric(vertical: 18),
          textStyle: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            // fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          )));
}
