import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/layout/Quran/models/sura_data.dart';

import '../../../constant/app_assets.dart';
import '../sura_details.dart';

class HistoryWidget extends StatelessWidget {
  SuraData suraData;
   HistoryWidget({super.key,
  required this.suraData
  });


  @override
  Widget build(BuildContext context) {
    var theme= Theme.of(context);
    return  InkWell(
      onTap: () {
        Navigator.pushNamed(context, suraDetails.routeName,
            arguments: suraData);
      },
      child: Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(20),

        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(suraData.suraEn,
                      style:
                      theme.textTheme.bodyLarge!.copyWith(
                          color: theme.primaryColorDark
                      )
                  ),
                  Text(suraData.suraAr,
                      style:
                      theme.textTheme.bodyLarge!.copyWith(
                          color: theme.primaryColorDark
                      )
                  ),
                  Text(suraData.ayaNum,
                      style:
                      theme.textTheme.bodyLarge!.copyWith(
                          color: theme.primaryColorDark
                      )
                  ),
                ],
              ),
            ),
            SizedBox(width: 10,),
            Image.asset( AppAssets.historyphoto, height: 150),
          ],
        ),
      ),
    );
  }
}
