import 'package:flutter/material.dart';
import 'package:islami/core/constant/app_assets.dart';
import 'package:islami/core/layout/layout_screen.dart';
import 'package:islami/core/theme/app_colors.dart';

class splashScreen extends StatefulWidget {
  static const String routeName="splash";
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
  Future.delayed(Duration(seconds: 3),(){
    Navigator.pushReplacementNamed(context, layoutScreen.routeName);
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Center(
        child: Column(
          children: [
              Spacer(),
            Image.asset(AppAssets.islamilogo),
            Spacer(),
            Image.asset(AppAssets.routelogo)
          ],
        ),
      ),
    );
  }
}
