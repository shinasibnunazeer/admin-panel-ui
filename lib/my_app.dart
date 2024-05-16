import 'package:admin_panel/navigation_menu.dart';
import 'package:admin_panel/utils/const/colors.dart';
import 'package:admin_panel/utils/temes/text_field_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//fonts
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

        //banner
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            backgroundColor: AColors.backgroundColor,
          ),
          //box decoration

          dataTableTheme: DataTableThemeData(
            //box deco

            headingTextStyle:
                const TextStyle(color: Colors.white, fontSize: 16),
            dataRowColor: WidgetStateColor.resolveWith(
                (states) => AColors.backgroundColor),
            headingRowColor: WidgetStateColor.resolveWith(
                (states) => AColors.iconPrimaryColor),
          ),

          fontFamily: GoogleFonts.poppins().fontFamily,
          //font family
          iconTheme: const IconThemeData(color: AColors.iconPrimaryColor),
          scaffoldBackgroundColor: AColors.backgroundColor,
          useMaterial3: true,
          inputDecorationTheme: ATextfieldTheme.textfieldTheme,
        ),
        themeMode: ThemeMode.light,
        home: const ANavigationMenu());
  }
}
