import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

// HomeScreenState is not private because of widget testing
// in test/screens/home_screen_test.dart
class HomeScreenState extends State<HomeScreen> {
  Color _currentBackgroundColor;
  Color _textColor;

  @override
  void initState() {
    super.initState();
    _currentBackgroundColor = _getRandomColor();
    _setTextColor();
  }

  /// Getter for [_currentBackgroundColor]. Is needed only for widget testing
  Color get currentColor => _currentBackgroundColor;

  void _changeColor() {
    setState(() {
      _currentBackgroundColor = _getRandomColor();
      _setTextColor();
    });
  }

  // I haven't used random generation of Alpha value because transparency can
  // cause problems with determining the exact lightness of the background color
  // and so that with the text color
  Color _getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  /// Sets the [_textColor] to black or white color depends on the lightness
  /// of the [_currentBackgroundColor]
  void _setTextColor() {
    final currentBgColorHSL = HSLColor.fromColor(_currentBackgroundColor);
    _textColor = currentBgColorHSL.lightness > 0.6
        ? Colors.black
        : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: _currentBackgroundColor,
        ),
        child: Material(
          color: Colors.transparent,
          // It also could be the GestureDetector here instead of the InkWell,
          // but I decided to use it because of its nice ripple animation
          child: InkWell(
            onTap: _changeColor,
            child: SafeArea(
              child: Center(
                child: Text(
                  'Hey there',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: _textColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}