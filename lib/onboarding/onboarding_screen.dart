import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/layout/adhan/adhanscreen.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/onboarding/onboarding_data.dart';
import 'package:islami/onboarding/widgets/dot_indecator.dart';
import 'package:islami/onboarding/widgets/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/layout/layout_screen.dart';
import '../core/constant/app_assets.dart';
import 'onboarding_data.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = "OnboardingScreen";
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<OnBoardingData> OnBoardingList = [
    OnBoardingData(
      imagePath: "assets/images/onboaring1.png",
      title: "Welcome To Islmi App",
    ),
    OnBoardingData(
        imagePath: "assets/images/onboaring2.png",
        title: "Welcome To App",
        description: "We Are Very Excited To Have You In Our Community"),
    OnBoardingData(
        imagePath: "assets/images/onboaring3.png",
        title: "Reading the Quran",
        description: "Read, and your Lord is the Most Generous"),
    OnBoardingData(
        imagePath: "assets/images/onboaring4.png",
        title: "Bearish",
        description: "Praise the name of your Lord, the Most High"),
    OnBoardingData(
        imagePath: "assets/images/onboaring5.png",
        title: "Holy Quran Radio",
        description:
        "You can listen to the Holy Quran Radio through the application for free and easily"),
  ];

  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(
          () {
        setState(() {
          currentIndex = pageController.page?.toInt() ?? 0;
        });
      },
    );
  }

  /// **نقل الدالة داخل `State` لتتمكن من الوصول إلى `context`**
  Future<void> _setOnBoardingAsDone() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool("first time", false);
    Navigator.pushReplacementNamed(context, layoutScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Column(
        children: [
          SafeArea(
            child: Center(
              child: Column(
                children: [
                  Image.asset(AppAssets.homelogo),
                ],
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemBuilder: (context, index) => OnboardingPage(
                data: OnBoardingList[index],
              ),
              itemCount: OnBoardingList.length,
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: currentIndex != 0
                          ? () {
                        pageController.animateToPage(currentIndex - 1,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.fastOutSlowIn);
                      }
                          : null,
                      child: Text(currentIndex != 0 ? "Back" : "",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                              color: AppColor.coffee,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      onPressed: () {
                        if (currentIndex == 4) {
                          _setOnBoardingAsDone();
                        } else {
                          pageController.animateToPage(currentIndex + 1,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.fastOutSlowIn);
                        }
                      },
                      child: Text(currentIndex == 4 ? "Finish" : "Next",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                              color: AppColor.coffee,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  OnBoardingList.length,
                      (index) => DotIndecator(isActive: currentIndex == index),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}