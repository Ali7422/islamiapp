import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/layout/adhan/adhanscreen.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/app_theme.dart';
import 'package:islami/onboarding/onboarding_data.dart';

import '../onboarding_data.dart';

class OnboardingPage extends StatelessWidget {
  final OnBoardingData data;
  const OnboardingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(child: Image.asset(data.imagePath)),
          SizedBox(
            height: 24.h,
          ),
          Text(
            data.title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColor.coffee, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(
            height: 24.h,
          ),
          if (data.description != null)
            Text(
              textAlign: TextAlign.center,
              data.description!,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColor.coffee,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
        ],
      ),
    );
  }
}
