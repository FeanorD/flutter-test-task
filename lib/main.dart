import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:random_background_app/providers/color_gen_options_provider.dart';
import 'package:random_background_app/screens/home_screen.dart';
import 'package:random_background_app/screens/settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ColorGenerationOptions(),
      child: MaterialApp(
        title: 'Random Background App',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.quicksandTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => HomeScreen(),
          SettingsScreen.routeName: (ctx) => SettingsScreen(),
        },
      ),
    );
  }
}


