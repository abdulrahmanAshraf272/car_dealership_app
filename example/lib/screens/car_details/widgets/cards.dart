import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bluetooth_serial_example/constans/constant_strings.dart';
import 'package:flutter_bluetooth_serial_example/hold_values.dart';

import 'package:flutter_bluetooth_serial_example/models/car.dart';
import 'package:flutter_bluetooth_serial_example/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Cards extends StatelessWidget {
  final Car car;
  const Cards({Key? key, required this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          Expanded(
            child: CardInfoItem(
                context: context,
                car: car,
                icon: firstCardIcon,
                title: 'المحرك',
                subtitle: car.engineFeatures[0].title,
                onPress: () {
                  HoldValues.titleCardSelected = 'المحرك';
                  HoldValues.featuresListSelected = car.engineFeatures;
                  Get.toNamed(
                    RoutesClass.carSpecificationsScreen,
                  );
                }),
          ),
          Expanded(
            child: CardInfoItem(
                context: context,
                car: car,
                icon: secondCardIcon,
                title: 'الآداء',
                subtitle: car.performanceFeatures[0].title,
                onPress: () {
                  HoldValues.titleCardSelected = 'الآداء';
                  HoldValues.featuresListSelected = car.performanceFeatures;
                  Get.toNamed(
                    RoutesClass.carSpecificationsScreen,
                  );
                }),
          ),
          Expanded(
            child: CardInfoItem(
                context: context,
                car: car,
                icon: thirdCardIcon,
                title: 'التصميم الداخلي',
                subtitle: car.interiorFeatures[0].title,
                onPress: () {
                  HoldValues.titleCardSelected = 'التصميم الداخلي';
                  HoldValues.featuresListSelected = car.interiorFeatures;
                  Get.toNamed(
                    RoutesClass.carSpecificationsScreen,
                  );
                }),
          ),
          Expanded(
            child: CardInfoItem(
                context: context,
                car: car,
                icon: forthCardIcon,
                title: 'التصميم الخارجي',
                subtitle: car.exteriorFeatures[0].title,
                onPress: () {
                  HoldValues.titleCardSelected = 'التصميم الخارجي';
                  HoldValues.featuresListSelected = car.exteriorFeatures;
                  Get.toNamed(
                    RoutesClass.carSpecificationsScreen,
                  );
                }),
          ),
          Expanded(
            child: CardInfoItem(
                context: context,
                car: car,
                icon: fifthCardIcon,
                title: 'التجهيزات التقنية',
                subtitle: car.techFeatures[0].title,
                onPress: () {
                  HoldValues.titleCardSelected = 'التجهيزات التقنية';
                  HoldValues.featuresListSelected = car.techFeatures;
                  Get.toNamed(
                    RoutesClass.carSpecificationsScreen,
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget CardInfoItem(
      {required icon,
      required String title,
      required String subtitle,
      required Function() onPress,
      required BuildContext context,
      required Car car}) {
    double safeAreaHeight = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height - safeAreaHeight;
    return GestureDetector(
      onTap: onPress,
      child: Container(
        //width: 50.w,
        height: screenHeight * 0.28,
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.h),
            color: Color(0xFFE5E5E5),
            boxShadow: [
              BoxShadow(
                  offset: Offset(-4, 8),
                  blurRadius: 12,
                  color: Colors.black.withOpacity(0.25))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset(
              icon,
              width: 10.w,
            ),
            AutoSizeText(
              title,
              maxLines: 1,
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontFamily: fontFamilyPoppins,
                  fontWeight: FontWeight.bold,
                  fontSize: 5.sp),
            ),
            Expanded(
              child: AutoSizeText(
                subtitle,
                maxLines: 2,
                minFontSize: 4,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end,
                style: TextStyle(fontFamily: fontFamilyPoppins, fontSize: 5.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
