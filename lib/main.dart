import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/screens/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/layout/Quran/sura_details.dart';
import 'core/layout/hadeth/hadeth_details_screen.dart';
import 'core/layout/layout_screen.dart';
import 'core/theme/app_theme.dart';
import 'onboarding/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isFirstTime = await _checkFirstTime();

  runApp(MyApp(isFirstTime: isFirstTime));
}Future<bool> _checkFirstTime() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool firstTime = prefs.getBool("first_time") ?? true;

  if (firstTime) {
    await prefs.setBool("first_time", false);
  }

  return firstTime;
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;
  const MyApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        routes: {
          splashScreen.routeName: (context) => splashScreen(),
          layoutScreen.routeName: (context) => layoutScreen(),
          suraDetails.routeName: (context) => suraDetails(),
          OnboardingScreen.routeName: (context) => OnboardingScreen(),
          HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
        },
        initialRoute: isFirstTime ? OnboardingScreen.routeName : layoutScreen.routeName,
      ),
    );
  }
}
