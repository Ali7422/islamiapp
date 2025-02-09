import 'package:flutter/material.dart';
import 'package:islami/core/layout/hadeth/models/hadethmodel.dart';

import '../../../constant/app_assets.dart';

class HadethCardWidget extends StatelessWidget {
  HadethData hadethData;
   HadethCardWidget({super.key,required this.hadethData});

  @override
  Widget build(BuildContext context) {
    var theme =Theme.of(context);
    return
      Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child:
        Column(
          children: [
            Row(
              textDirection: TextDirection.ltr,
              children: [
                Image.asset(AppAssets.suraDetailsLift,
                    color: theme.primaryColorDark),
                Container(
                  child:Expanded(
                    child: FittedBox(
                      child: Center(
                        child: Text(
                            hadethData.title,
                            style: theme.textTheme.bodyMedium!.copyWith(
                                color: theme.primaryColorDark)),
                      ),
                    ),
                  ),
                ),
                Image.asset(AppAssets.suraDetailsRight,
                    color: theme.primaryColorDark),

              ],
            ),
            Center(
              child: Text(
                textDirection: TextDirection.rtl,
                hadethData.body,
                style: theme.textTheme.bodyMedium!
                  .copyWith(color: theme.primaryColorDark)
              ),
            )
          ],
        )
    );
  }
}



// import 'package:flutter/material.dart';
//
// import '../../../constant/app_assets.dart';
// import '../../../theme/app_colors.dart';
// import '../../Quran/sura_details.dart';
// import '../../Quran/sura_details.dart';
// import '../hadeth_details_screen.dart';
// import '../hadethscreen.dart';
// class HadethCardWidget extends StatelessWidget {
//   HadethData hadethData;
//
//   HadethCardWidget({super.key, required this.hadethData});
//
//   @override
//   Widget build(BuildContext context) {
//     var theme=Theme.of(context);
//     return InkWell(
//       onTap: () {
//         Navigator.pushNamed(context, HadethDetailsScreen.routeName,
//             arguments: hadethData);
//       },
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 12),
//         decoration: BoxDecoration(
//             color: AppColor.coffee,
//             borderRadius: BorderRadius.circular(20)),
//         child: Stack(
//           children: [
//             Column(
//               children: [
//                 Expanded(child: Image.asset(AppAssets.hadethcardbg)),
//                 ClipRRect(
//                     borderRadius: BorderRadius.circular(20),
//                     child: Image.asset(AppAssets.suradetails)),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
//                   Row(
//                     textDirection: TextDirection.ltr,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Image.asset(
//                         AppAssets.suraDetailsLift,
//                         color: AppColor.black,
//                       ),
//                       Expanded(
//                         child: Center(
//                           child: Text(hadethData.title,
//                               style: const TextStyle(
//                                   color: AppColor.black,
//                                   fontSize: 26,
//                                   fontWeight: FontWeight.bold)),
//                         ),
//                       ),
//                       Image.asset(
//                         AppAssets.suraDetailsRight,
//                         color: AppColor.black,
//                       ),
//                     ],
//                   ),
//                   Text(
//                     hadethData.body,
//                     style: theme.textTheme.bodyLarge!
//                       .copyWith(color: theme.primaryColorDark)
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }