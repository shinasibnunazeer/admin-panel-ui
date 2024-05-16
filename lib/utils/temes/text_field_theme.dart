import 'package:admin_panel/utils/const/colors.dart';
import 'package:flutter/material.dart';

class ATextfieldTheme {
  static InputDecorationTheme textfieldTheme = InputDecorationTheme(
    //foucs node

    errorMaxLines: 3,
    suffixIconColor: AColors.primaryColor,
    prefixIconColor: AColors.primaryColor,
    labelStyle: const TextStyle().copyWith(
      color: Colors.black,
      fontSize: 14,
    ),
    hintStyle: const TextStyle().copyWith(
      color: Colors.black,
      fontSize: 14,
    ),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(
      color: Colors.black.withOpacity(0.8),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.grey,
        width: 1,
      ),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.grey,
        width: 1,
      ),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.black12,
        width: 1,
      ),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.orange,
        width: 1,
      ),
    ),
  );
}
