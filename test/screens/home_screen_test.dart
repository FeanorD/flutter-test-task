import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:random_background_app/main.dart';
import 'package:random_background_app/screens/home_screen.dart';

void main() {
  group('HomeScreen widget tests', () {
    testWidgets('Testing if Text widget shows up', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      expect(find.byType(Text), findsOneWidget);
    });

    testWidgets('Color changes after tapping on random position on the screen',
      (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      Random random = Random();
      var safeArea = find.byType(SafeArea);
      var size = tester.getSize(safeArea);
      var dx = random.nextDouble() * size.width;
      var dy = random.nextDouble() * size.height;

      var homeScreen = find.byType(HomeScreen);
      var homeScreenState = tester.state<HomeScreenState>(homeScreen);
      var prevColor = homeScreenState.currentColor;

      await tester.tapAt(Offset(dx, dy));
      var currColor = homeScreenState.currentColor;
      expect(prevColor == currColor, false);
    });
  });
}