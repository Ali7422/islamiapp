import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/constant/app_assets.dart';
import 'package:islami/core/layout/adhan/adhanscreen.dart';
import 'package:islami/core/layout/radio/radio_item.dart';
import 'package:islami/core/theme/app_colors.dart';

class RadioScreen extends StatelessWidget {

   RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppAssets.radiobg), fit: BoxFit.cover),
      ),
      child: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Image.asset(AppAssets.homelogo),
               Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(12.r),
                   color: Color(0xB3202020)
                 ),
                 child: TabBar(
                   dividerHeight: 0,
                   indicatorSize: TabBarIndicatorSize.tab,
                   indicator: BoxDecoration(
                     color: AppColor.coffee,
                     borderRadius: BorderRadius.circular(12.r)
                   ),
                  unselectedLabelStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColor.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,

                  ) ,
                  tabs: [
                    Tab(text: "Radio"),
                    Tab(text: "Reciters"),
                  ],
                               ),
               ),
              Expanded(
                child: TabBarView(children: [
                ListView.builder(
                    itemBuilder: (context, index) {
                      return RadioItem();
                    },
                  itemCount: 10,

                ),
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return RadioItem();
                    },
                    itemCount: 10,

                  ),

                ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
