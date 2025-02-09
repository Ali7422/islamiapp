import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/app_assets.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_theme.dart';

class AzkarWidget  extends StatelessWidget {
  final String imagePath;
  final String title;
  const AzkarWidget ({super.key,required this.imagePath,required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185.w,
      height: 259.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
              color: AppTheme.darkTheme.primaryColor,
              width: 3
          )
      ),
      child: Column(
        children: [
          SizedBox(
            height: 23.h,
          ),
          Image.asset(imagePath,fit: BoxFit.cover,),
          Text(
              textAlign: TextAlign.center,
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColor.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              )
          )
        ],
      ),
    );
  }
}
