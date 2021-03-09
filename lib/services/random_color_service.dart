import 'dart:math';

import 'package:flutter/material.dart';

class RandomColorService {
  static Color getColorFromRange(RangeValues values) {
    return Color(Random().nextInt(values.end.toInt() + 1) + values.start.toInt());
  }

  static Color getColorFromList(List<Color> colors) {
    return colors[Random().nextInt(colors.length)];
  }
}