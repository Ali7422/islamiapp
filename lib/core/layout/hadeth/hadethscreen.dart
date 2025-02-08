import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/layout/hadeth/widget/hadeth_card_widget.dart';

import '../../constant/app_assets.dart';
import 'models/hadethmodel.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}
class _HadethScreenState extends State<HadethScreen> {
  List<HadethData> ahadeth = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    readHadeth();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.hadethbg), fit: BoxFit.cover)),
      child: Center(
        child: SafeArea(
          child: isLoading
              ? const CircularProgressIndicator()
              : Column(
            children: [
              Image.asset(AppAssets.homelogo),
              Expanded(
                child: CarouselSlider.builder(
                  itemCount: ahadeth.length,
                  itemBuilder: (context, index, realIndex) {
                    return HadethCardWidget(hadethData: ahadeth[index]);
                  },
                  options: CarouselOptions(
                    height: double.infinity,
                    enlargeFactor: 3,
                    enableInfiniteScroll: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    disableCenter: true,
                    animateToClosest: true,
                    pageSnapping: true,
                    padEnds: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void readHadeth() async {
    List<HadethData> loadedAhadeth = [];

    for (int i = 1; i <= 50; i++) {
      try {
        String fullHadeth = await rootBundle.loadString("assets/hadeeth/hadeeth/h$i.txt");
        List<String> hadethParts = fullHadeth.split("\n");

        if (hadethParts.length >= 2) {
          loadedAhadeth.add(HadethData(
            title: hadethParts[0].trim(),
            body: hadethParts.sublist(1).join("\n").trim(),
          ));
        }
      } catch (e) {
      }
    }

    setState(() {
      ahadeth = loadedAhadeth;
      isLoading = false;
    });
  }
}
