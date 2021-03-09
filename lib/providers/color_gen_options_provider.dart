import 'package:flutter/material.dart';
import 'package:random_background_app/services/random_color_service.dart';

enum ColorRangeType {
  primary,
  accents,
  custom,
}

class ColorGenerationOptions with ChangeNotifier {
  ColorRangeType _rangeType = ColorRangeType.primary;
  RangeValues _customRange;
  List<Color> _colors = Colors.primaries;

  Color getRandomColor() {
    return _rangeType == ColorRangeType.custom
        ? RandomColorService.getColorFromRange(_customRange)
        : RandomColorService.getColorFromList(_colors);
  }

  ColorRangeType get rangeType => _rangeType;

  void setColorsList(List<Color> colors) {
    _colors = colors;
    notifyListeners();
  }

  void setRange(RangeValues values) {
    _customRange = values;
    notifyListeners();
  }

  void setRangeType(ColorRangeType type) {
    _rangeType = type;
    notifyListeners();
  }
}