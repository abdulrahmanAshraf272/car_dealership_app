import 'package:flutter/material.dart';

const String fontFamilyPoppins = 'Poppins';

const String smallDescription =
    'تمتع بالمواد الراقية وخامات السيارة عالية الجودة, جميع المكونات الداخلية في سيارة رينو ميجان الجديدة مطعمة بالكروم والمزيد. تهتم ميجان بالتفاصيل..';

const String firstCardTitle = 'المحرك';
const String secondCardTitle = 'الآداء';
const String thirdCardTitle = 'التصميم الداخلي';
const String forthCardTitle = 'التصميم الخارجي';
const String fifthCardTitle = 'التجهيزات التقنية';

const String firstCardSubtitle = '160 حصان وعزم دوران 240 نيوتن متر';
const String secondCardSubtitle = 'سرعتها القصوى 220 km/h 0 - 100 في 7.5 ثانية';

const String thirdCardSubtitle =
    'المقاعد مريحة ومدعم جيدًا، كما أن مساحة الركاب واسعة ...';

const String forthCardSubtitle = 'يتميز التصميم الخارجي  بالجرأة والحداثة ...';

const String fifthCardSubtitle =
    'شاشة لمس مقاس 9.3 بوصة تعمل باللمس. والمزيد ..';

const String firstCardIcon = 'assets/icons/engine_icon.png';
const String secondCardIcon = 'assets/icons/speed_icon.png';
const String thirdCardIcon = 'assets/icons/car_out_icon.png';
const String forthCardIcon = 'assets/icons/wheel_icon.png';
const String fifthCardIcon = 'assets/icons/car_tech_icon.png';

class ScreenDimentions {
  late double screenHeight;
  late double screenWidth;
  BuildContext context;

  ScreenDimentions({required this.context}) {
    screenWidth = MediaQuery.of(context).size.width;
    double safeAreaHeight = MediaQuery.of(context).padding.top;
    screenHeight = MediaQuery.of(context).size.height - safeAreaHeight;
  }
}
