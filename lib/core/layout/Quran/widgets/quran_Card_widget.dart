import 'package:flutter/material.dart';
import 'package:islami/core/layout/Quran/quranscreen.dart';
import 'package:islami/core/layout/Quran/sura_details.dart';

import '../../../constant/app_assets.dart';
import '../models/sura_data.dart';

class quranCardWidget extends StatelessWidget {
  SuraData suraData;
  void Function(int value)onTap;
   quranCardWidget({super.key,
     required this.suraData,
   required this.onTap,


   });

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);

    return InkWell(
      onTap: (){
        onTap(suraData.index);
        Navigator.pushNamed(context, suraDetails.routeName,arguments: suraData);
      },
      child: Row(
        children: [
          Stack(
            fit: StackFit.loose,
            alignment: Alignment.center,
            children: [

              Image.asset(
                  AppAssets.suraicon
              ),
               Text(
                "${suraData.index+1}",
           style: theme.textTheme.bodyMedium,
              )
            ],
          ),
          const SizedBox(
            width: 24,
          ),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  suraData.suraEn,
                style: theme.textTheme.bodyLarge


              ),
              Text(
                "${suraData.ayaNum} Verses",
                style: theme.textTheme.bodySmall
              )

            ],
          ),
          const Spacer(),
           Text(
               suraData.suraAr,
            style: theme.textTheme.bodyLarge!



          ),
        ],
      ),
    );
  }
}

