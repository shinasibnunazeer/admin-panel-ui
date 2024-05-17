import 'package:admin_panel/utils/const/colors.dart';
import 'package:flutter/material.dart';

class ADataTableTheme {
  static DataTableThemeData dataTableTheme = DataTableThemeData(
    //box deco

    headingTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
    dataRowColor:
        WidgetStateColor.resolveWith((states) => AColors.backgroundColor),
    headingRowColor:
        WidgetStateColor.resolveWith((states) => AColors.iconPrimaryColor),
  );
}
