import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

//HomeScreenState is not private only for widget testing in test/screens/home_screen_test.dart
class HomeScreenState extends State<HomeScreen> {
  Color _currentColor;

  @override
  void initState() {
    super.initState();
    _currentColor = _getRandomColor();
  }

  ///Getter [currentColor] only for widget testing
  Color get currentColor => _currentColor;

  void _changeColor() {
    setState(() {
      _currentColor = _getRandomColor();
    });
  }

  Color _getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: _currentColor,
        ),
        //It also could be GestureDetector here instead of InkWell,
        //but I decided to use it because of its nice ripple animation
        child: InkWell(
          onTap: _changeColor,
          child: SafeArea(
            child: Center(
              child: Text(
                'Hey there',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}