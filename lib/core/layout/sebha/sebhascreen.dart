import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/core/constant/app_assets.dart';
import 'package:islami/main.dart';

class sebhascreen extends StatefulWidget {
  const sebhascreen({super.key});

  @override
  State<sebhascreen> createState() => _sebhascreenState();
}

class _sebhascreenState extends State<sebhascreen> {
  double turn = 0;
  List<String> azkar = [
    "سبحان الله",
    "الحمدلله",
    "الله أكبر",
    "لا إله إلا الله",
  ];
  int counter = 0;
  int index = 0;
  @override

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppAssets.sebhabg), fit: BoxFit.cover),
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset(AppAssets.homelogo),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.white, fontSize: 36),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Image.asset(
                              width: 73.w, height: 86.h, AppAssets.sebhahead),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 70.h),
                              child: AnimatedRotation(
                                turns: turn,
                                duration: Duration(milliseconds: 500),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      turn += 1 / 36;
                                      counter++;
                                      if (counter == 30) {
                                        index++;
                                        counter = 0;
                                        if (index == azkar.length) {
                                          index = 0;
                                        }
                                      }
                                    });
                                  },
                                  child: Image.asset(
                                      width: 379.w,
                                      height: 381.h,
                                      AppAssets.sebhabody),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 50.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    azkar[index],
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                        color: Colors.white, fontSize: 36),
                                  ),
                                  SizedBox(
                                    height: 25.h,
                                  ),
                                  Text(
                                    "$counter",
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                        color: Colors.white, fontSize: 36),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }}