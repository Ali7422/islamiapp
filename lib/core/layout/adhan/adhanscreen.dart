import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/layout/adhan/azkar_widget.dart';
import 'package:islami/core/layout/adhan/time_tab.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/core/theme/app_theme.dart';

import '../../constant/app_assets.dart';

class adhanscreen extends StatelessWidget {
  const adhanscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppAssets.adhanabg), fit: BoxFit.cover),
      ),
      child: SafeArea(
        child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              children: [
                Image.asset(AppAssets.homelogo),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        width: 390.w,
                        height: 301.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.r),
                            image: DecorationImage(
                                image: AssetImage(AppAssets.sallahabg))),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text("16 jul",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                                color: Colors.white,
                                                fontSize: 16)),
                                    Text("2024",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                                color: Colors.white,
                                                fontSize: 16))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text("Pray Time",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                                color: Colors.black54,
                                                fontSize: 16)),
                                    Text("Tuesday",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                                color: Colors.black,
                                                fontSize: 20))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text("9 muh",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                                color: Colors.white,
                                                fontSize: 16)),
                                    Text("1446",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                                color: Colors.white,
                                                fontSize: 16))
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 29.h,
                            ),
                            Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) => TimeTab(),
                            )),
                            SizedBox(
                              height: 18.h,
                            ),
                            Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Next Pray - 02:32",
                                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: Color(0xff202020),
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: 83.w,
                                ),

                                ImageIcon(AssetImage(AppAssets.volumeicon))
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Azkar",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AppColor.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      SizedBox(
                        height: 31.h,
                      ),
                     Row(
                       children: [
                         AzkarWidget(imagePath: AppAssets.eveningazkar, title: "Evening Azkar"),
                         SizedBox(
                           width: 10.w,
                         ),
                         AzkarWidget(imagePath: AppAssets.eveningazkar, title: "Evening Azkar"),
                       ],
                     )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
