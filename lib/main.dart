import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/app_theme.dart';
import 'package:islami/screens/splash/splash_screen.dart';

import 'core/layout/Quran/sura_details.dart';
import 'core/layout/layout_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme:AppTheme.darkTheme,

      themeMode: ThemeMode.dark,
      routes: {
    splashScreen.routeName: (context)=> splashScreen(),
        layoutScreen.routeName: (context)=> layoutScreen(),
        suraDetails.routeName: (context)=> suraDetails(),
    },
      initialRoute: splashScreen.routeName,
    );
  }
}