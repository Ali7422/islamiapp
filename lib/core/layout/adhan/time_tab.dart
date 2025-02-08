import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/app_assets.dart';
import '../../theme/app_colors.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      padding: EdgeInsets.all(13),
      width: 104.w,
      height: 128.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          image: DecorationImage(
              image: AssetImage(AppAssets.sallahtime), fit: BoxFit.cover)),
      child: Column(
        children: [
          Text("ASR",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColor.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 6,
          ),
          Text("04:38",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColor.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
          Text("PM",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColor.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
