import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/constant/app_assets.dart';
import 'package:islami/core/layout/Quran/quranscreen.dart';
import 'package:islami/core/layout/Quran/widgets/quran_Card_widget.dart';
import 'package:islami/core/theme/app_colors.dart';

import 'models/sura_data.dart';
class suraDetails extends StatefulWidget {
  static const String routeName="suraDetails";
  const suraDetails({super.key});

  @override
  State<suraDetails> createState() => _suraDetailsState();
}

class _suraDetailsState extends State<suraDetails> {
  bool isLight = false;
  String suraDetails = "";
  List<String> aya=[];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var arg = ModalRoute.of(context)!.settings.arguments as SuraData;
     if (suraDetails.isEmpty){
       readFile(arg.index);
     }
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
              arg.suraAr
          ),
        ),
      ),
      body: Column(

        children: [
          Row(
            textDirection: TextDirection.ltr,
            children: [
              Image.asset(AppAssets.suraDetailsLift),
              Container(
                child: Expanded(
                  child: Center(
                    child: Text(
                        arg.suraAr,
                        style: theme.textTheme.bodyLarge!.copyWith(
                            color: theme.primaryColor)),
                  ),
                ),
              ),


              Image.asset(AppAssets.suraDetailsRight)
            ],
          ),
             suraDetails.isEmpty?
            Center(child: CircularProgressIndicator())
            :Expanded(
              child: ListView.builder(
                itemCount: aya.length,
                  itemBuilder:(context,index) {
                  return Container(
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white)
                    ),
              
                      child: Center(child: Text(aya[index]+" "+("[${index+1}]").toString(),
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium!.copyWith(color: theme.primaryColor ))));
              
              }),
            ),

        ],
      ),

    );
  }

  void readFile(int index) async {
    suraDetails = await rootBundle.loadString("assets/Suras/${index + 1}.txt");
    aya = suraDetails.trim().split("\n");
    setState(() {});
  }

}