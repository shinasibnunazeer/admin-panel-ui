import 'package:flutter/material.dart';

class ADeviceUtils {
  //screen width
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  //screen height
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  //status bar height
  static double statusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  //bottom bar height
  static double bottomBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  //text scale factor
  static double textScaleFactor(BuildContext context) {
    return MediaQuery.of(context).textScaleFactor;
  }

  //device pixel ratio
  static double devicePixelRatio(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio;
  }

  //platform
  static TargetPlatform platform(BuildContext context) {
    return Theme.of(context).platform;
  }

  //is landscape
  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  //is portrait
  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  //is mobile
  static bool isMobile(BuildContext context) {
    return screenWidth(context) < 600;
  }

  //is tablet
  static bool isTablet(BuildContext context) {
    return screenWidth(context) >= 600;
  }

  //is desktop
  static bool isDesktop(BuildContext context) {
    return screenWidth(context) > 1440;
  }
}
