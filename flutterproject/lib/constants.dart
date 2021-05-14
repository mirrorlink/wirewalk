import 'package:flutter/widgets.dart';
import 'package:universal_html/html.dart' as html;

class Constants {
  static const Color LIGHT = Color(0xFFd0d6a3);
  static const Color MED = Color(0xFFd65168);
  static const Color DARK = Color(0xFF211c12);

  static const int BAR_SCROLL = 400;
  static const int CITY_SCROLL = 1200;
  static const int CITY_CHARWALK = 1800;
  static const int CITY_SCROLL_FULL = 2200;

  static const int MAX_SCALE = 5;

  static bool isTouchScreen() {
    String userAgent = html.window.navigator.userAgent.toString().toLowerCase();
    // smartphone
    if (userAgent.contains("iphone")) return true;
    if (userAgent.contains("android")) return true;

    // tablet
    if (userAgent.contains("ipad")) return true;
    if (html.window.navigator.platform.toLowerCase().contains("macintel") &&
        html.window.navigator.maxTouchPoints > 0) return true;

    return false;
  }

  static double adjustOffset(double scroll, int scale) {
    return scroll * (1 / (scale.toDouble() / MAX_SCALE.toDouble()));
  }
}
