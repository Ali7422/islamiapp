import 'package:flutter/material.dart';
import 'package:islami/core/constant/app_assets.dart';
import 'package:islami/core/layout/Quran/quranscreen.dart';
import 'package:islami/core/layout/adhan/adhanscreen.dart';
import 'package:islami/core/layout/hadeth/hadethscreen.dart';
import 'package:islami/core/layout/radio/radioscreen.dart';
import 'package:islami/core/layout/sebha/sebhascreen.dart';
import 'package:islami/core/theme/app_colors.dart';
class layoutScreen extends StatefulWidget {
  static const String routeName ="layout";
  const layoutScreen ({super.key});

  @override
  State<layoutScreen> createState() => _layoutScreenState();
}

class _layoutScreenState extends State<layoutScreen> {
  int selectedIndex=0;
  List<Widget> screens= [
    quranscreen(),
    HadethScreen(),
    sebhascreen(),
    RadioScreen(),
    adhanscreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          selectedIndex=value;
          setState(() {

          });

        },
          currentIndex: selectedIndex,
        backgroundColor: AppColor.coffee,
          fixedColor: AppColor.white,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(
            color: AppColor.white
          ),
          selectedLabelStyle: TextStyle(
            color: AppColor.white
          ),
          showUnselectedLabels: false,


          items: [
        BottomNavigationBarItem(icon:Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4,
            ),
            decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(16),
                color: selectedIndex !=0
                    ? Colors.transparent :AppColor.black.withOpacity(0.6)
            ),
            child: ImageIcon(AssetImage(AppAssets.quranicon))) ,label:"Quran" ),
        BottomNavigationBarItem(icon:Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4,
            )
            ,
            decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(16),
                color: selectedIndex !=1?
                Colors.transparent :AppColor.black.withOpacity(.6)
            ),
            child: ImageIcon(AssetImage(AppAssets.hadethicon))) ,label:"Hadeth" ),
        BottomNavigationBarItem(icon:Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4,
            )
            ,
            decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(16),
                color: selectedIndex !=2?
                Colors.transparent :AppColor.black.withOpacity(.6)
            ),
            child: ImageIcon(AssetImage(AppAssets.sebhaicon))) ,label:"Sebha"),
        BottomNavigationBarItem(icon:Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4,
            )
            ,
            decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(16),
                color: selectedIndex !=3?
                Colors.transparent :AppColor.black.withOpacity(.6)
            ),
            child: ImageIcon(AssetImage(AppAssets.radioicon))) ,label:"Radio" ),
        BottomNavigationBarItem(icon:Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4,
            )
            ,
            decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(16),
                color: selectedIndex !=4?
                Colors.transparent :AppColor.black.withOpacity(.6)
            ),
            child: ImageIcon(AssetImage(AppAssets.adhanicon))) ,label:"Adhan" ),
    ]
      ),
      body: screens[selectedIndex],
    );
  }
}
