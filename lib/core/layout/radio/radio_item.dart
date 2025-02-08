import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/constant/app_assets.dart';
import 'package:islami/core/layout/adhan/adhanscreen.dart';
import 'package:islami/core/theme/app_colors.dart';

class RadioItem extends StatefulWidget {

   RadioItem({super.key});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  bool isPlay=true;

  bool isFav=false;

  bool isVolumeUp=true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.15,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColor.coffee,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        children: [
          isPlay? Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(AppAssets.radioitem)):
          Positioned(
              bottom: -35,
              left: -20,
              right: -20,
              child: Image.asset(AppAssets.radioitem2)),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Radio Ibrahim Al-Akdar",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColor.black, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        isFav=!isFav;
                        setState(() {
                        });
                      },
                      icon: isFav?
                      Icon(
                        Icons.favorite,
                        size: 30,
                        color: AppColor.black,
                      ):   Icon(
                        Icons.favorite_border,
                        size: 30,
                        color: AppColor.black,
                      )),
                  IconButton(
                      onPressed: () {
                        isPlay= !isPlay;
                        setState(() {

                        });
                      },
                      icon: isPlay?
                      Icon(
                        Icons.play_arrow,
                        size: 30,
                        color: AppColor.black,
                      ):
                      Icon(
                        Icons.pause,
                        size: 30,
                        color: AppColor.black,
                      )),
                  IconButton(
                      onPressed: () {
                        isVolumeUp=!isVolumeUp;
                        setState(() {
                        });
                      },
                      icon: isVolumeUp?Icon(
                        Icons.volume_up,
                        size: 30,
                        color: AppColor.black,
                      ):Icon(
                        Icons.volume_off,
                        size: 30,
                        color: AppColor.black,
                      ))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
