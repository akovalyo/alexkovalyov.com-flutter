import 'package:flutter/material.dart';

class Scroll with ChangeNotifier {
  double scrollPos = 0.0;
  double opacity = 0.0;
  ScrollMetrics scrollMetrics;

  void updateScroll(ScrollMetrics metrics, Size size) {
    scrollPos = metrics.pixels + size.height * 0.2;
    opacity =
        scrollPos > size.height * 0.5 ? 1 : scrollPos / (size.height * 0.5);
    notifyListeners();
  }
}
