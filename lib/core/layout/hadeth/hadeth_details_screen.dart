import 'package:flutter/material.dart';
import '../../constant/app_assets.dart';
import '../../theme/app_colors.dart';
import 'models/hadethmodel.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = "hadethDetails";

  const HadethDetailsScreen({super.key});

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var args = ModalRoute.of(context)?.settings.arguments;

    if (args == null || args is! HadethData) {
      return Scaffold(
        body: Center(child: Text("حدث خطأ أثناء تحميل الحديث")),
      );
    }

    var arg = args as HadethData;

    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        title: Text(arg.title),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(AppAssets.suradetails),
          Column(
            children: [
              Row(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppAssets.suraDetailsLift),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(arg.title,
                          style: const TextStyle(
                              color: AppColor.coffee,
                              fontSize: 35,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Image.asset(AppAssets.suraDetailsRight),
                ],
              ),
              Text(
                arg.body,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColor.coffee),
              )
            ],
          ),
        ],
      ),
    );
  }
}
