import 'package:flutter/material.dart';
import 'package:islami/core/constant/app_assets.dart';
import 'package:islami/core/layout/Quran/widgets/quran_Card_widget.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/sura_data.dart';

class quranscreen extends StatefulWidget {
  quranscreen({super.key});

  @override
  State<quranscreen> createState() => _quranscreenState();
}

class _quranscreenState extends State<quranscreen> {
  final List<String> suraNameAr = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  final List<String> suraNameEn = [
    "Al-Fatiha",
    "Al-Baqarah",
    "Aal-E-Imran",
    "An-Nisa'",
    "Al-Ma'idah",
    "Al-An'am",
    "Al-A'raf",
    "Al-Anfal",
    "At-Tawbah",
    "Yunus",
    "Hud",
    "Yusuf",
    "Ar-Ra'd",
    "Ibrahim",
    "Al-Hijr",
    "An-Nahl",
    "Al-Isra",
    "Al-Kahf",
    "Maryam",
    "Ta-Ha",
    "Al-Anbiya",
    "Al-Hajj",
    "Al-Mu'minun",
    "An-Nur",
    "Al-Furqan",
    "Ash-Shu'ara",
    "An-Naml",
    "Al-Qasas",
    "Al-Ankabut",
    "Ar-Rum",
    "Luqman",
    "As-Sajda",
    "Al-Ahzab",
    "Saba",
    "Fatir",
    "Ya-Sin",
    "As-Saffat",
    "Sad",
    "Az-Zumar",
    "Ghafir",
    "Fussilat",
    "Ash-Shura",
    "Az-Zukhruf",
    "Ad-Dukhan",
    "Al-Jathiya",
    "Al-Ahqaf",
    "Muhammad",
    "Al-Fath",
    "Al-Hujurat",
    "Qaf",
    "Adh-Dhariyat",
    "At-Tur",
    "An-Najm",
    "Al-Qamar",
    "Ar-Rahman",
    "Al-Waqi'a",
    "Al-Hadid",
    "Al-Mujadila",
    "Al-Hashr",
    "Al-Mumtahina",
    "As-Saff",
    "Al-Jumu'a",
    "Al-Munafiqun",
    "At-Taghabun",
    "At-Talaq",
    "At-Tahrim",
    "Al-Mulk",
    "Al-Qalam",
    "Al-Haqqah",
    "Al-Ma'arij",
    "Nuh",
    "Al-Jinn",
    "Al-Muzzammil",
    "Al-Muddathir",
    "Al-Qiyamah",
    "Al-Insan",
    "Al-Mursalat",
    "An-Naba'",
    "An-Nazi'at",
    "Abasa",
    "At-Takwir",
    "Al-Infitar",
    "Al-Mutaffifin",
    "Al-Inshiqaq",
    "Al-Buruj",
    "At-Tariq",
    "Al-A'la",
    "Al-Ghashiyah",
    "Al-Fajr",
    "Al-Balad",
    "Ash-Shams",
    "Al-Lail",
    "Ad-Duha",
    "Ash-Sharh",
    "At-Tin",
    "Al-Alaq",
    "Al-Qadr",
    "Al-Bayyina",
    "Az-Zalzalah",
    "Al-Adiyat",
    "Al-Qari'a",
    "At-Takathur",
    "Al-Asr",
    "Al-Humazah",
    "Al-Fil",
    "Quraysh",
    "Al-Ma'un",
    "Al-Kawthar",
    "Al-Kafirun",
    "An-Nasr",
    "Al-Masad",
    "Al-Ikhlas",
    "Al-Falaq",
    "An-Nas"
  ];

  final List<String> ayaNumber = [
    '7',
    '286',
    '200',
    '176',
    '120',
    '165',
    '206',
    '75',
    '129',
    '109',
    '123',
    '111',
    '43',
    '52',
    '99',
    '128',
    '111',
    '110',
    '98',
    '135',
    '112',
    '78',
    '118',
    '64',
    '77',
    '227',
    '93',
    '88',
    '69',
    '60',
    '34',
    '30',
    '73',
    '54',
    '45',
    '83',
    '182',
    '88',
    '75',
    '85',
    '54',
    '53',
    '89',
    '59',
    '37',
    '35',
    '38',
    '29',
    '18',
    '45',
    '60',
    '49',
    '62',
    '55',
    '78',
    '96',
    '29',
    '22',
    '24',
    '13',
    '14',
    '11',
    '11',
    '18',
    '12',
    '12',
    '30',
    '52',
    '52',
    '44',
    '28',
    '28',
    '20',
    '56',
    '40',
    '31',
    '50',
    '40',
    '46',
    '42',
    '29',
    '19',
    '36',
    '25',
    '22',
    '17',
    '19',
    '26',
    '30',
    '20',
    '15',
    '21',
    '11',
    '8',
    '5',
    '19',
    '5',
    '8',
    '8',
    '11',
    '11',
    '8',
    '3',
    '9',
    '5',
    '4',
    '6',
    '3',
    '6',
    '3',
    '5',
    '4',
    '5',
    '6'
  ];
  List<String> suraSearchAr = [];
  List<String> ayaNumberSearch = [];
  List<String> suraSearchEn = [];
  List<int> suraIds = [];
  List<int> ids = [];
  List<String> idsString = [];
  @override
  void initState() {
    getHistory();
    super.initState();
  }

  getHistory() async {
    List<String> history = [];
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    history = prefs.getStringList("history") ?? [];
    for (int i = 0; i < history.length; i++) {
      ids.add(int.parse(history[i]));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.quranbg), fit: BoxFit.cover)),
      child: Container(
        padding: EdgeInsets.all(12),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xB3202020), Color(0xff202020)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(AppAssets.homelogo)),
            TextField(
              onChanged: (value) {
                Search(value);
              },
              style: TextStyle(
                color: AppColor.white,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColor.coffee)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColor.coffee)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColor.coffee)),
                hintText: "Sura name",
                hintStyle: TextStyle(
                  color: AppColor.white,
                ),
                prefixIcon: ImageIcon(
                  AssetImage(AppAssets.quranicon),
                  color: AppColor.coffee,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            if (ids.isNotEmpty)
              SizedBox(
                height: 10,
              ),
            Text(
              "Suras List",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: suraSearchAr.isEmpty
                    ? suraNameAr.length
                    : suraSearchAr.length,
                itemBuilder: (context, index) {
                  print(suraNameAr.length);
                  return suraSearchAr.isEmpty
                      ? quranCardWidget(
                          suraData: SuraData(
                            suraAr: suraNameEn[index],
                            suraEn: suraNameEn[index],
                            ayaNum: ayaNumber[index],
                            index: index,
                          ),
                          onTap: surasave,
                        )
                      : quranCardWidget(
                          onTap: surasave,
                          suraData: SuraData(
                            suraAr: suraSearchAr[index],
                            suraEn: suraSearchEn[index],
                            ayaNum: ayaNumber[index],
                            index: suraIds[index],
                          ),
                        );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 20,
                    endIndent: 30,
                    indent: 30,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void Search(String q) {
    suraSearchAr = [];
    suraIds = [];
    ayaNumberSearch = [];
    suraSearchEn = [];
    suraSearchAr = suraNameAr.where(
      (element) {
        if (element.contains(q)) {
          suraSearchEn.add(suraNameEn[suraNameAr.indexOf((element))]);
          ayaNumberSearch.add(ayaNumber[suraNameAr.indexOf((element))]);
          suraIds.add(suraNameAr.indexOf(element));
        }
        return element.contains(q);
      },
    ).toList();
    setState(() {});
  }

  void surasave(int index) async {
    if (!ids.contains(index)) {
      ids.add(index);
      if (ids.length > 10) {
        ids.removeRange(10, ids.length);
      }
      idsString.add(index.toString());
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setStringList("History", idsString);
      setState(() {});
    }
  }
}
