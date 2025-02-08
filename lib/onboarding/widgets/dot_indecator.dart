import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/theme/app_colors.dart';

class DotIndecator extends StatelessWidget {
  final bool isActive;
  const DotIndecator({super.key,required this.isActive});

  @override
  Widget build(BuildContext context) {
    return  AnimatedContainer(duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 8.h,
      width: isActive?24:8.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.r),
      color: isActive? AppColor.coffee : Colors.grey
    ),);
  }
}
