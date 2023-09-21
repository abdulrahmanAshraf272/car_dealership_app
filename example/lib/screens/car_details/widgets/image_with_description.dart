import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial_example/constans/constant_strings.dart';
import 'package:flutter_bluetooth_serial_example/models/car.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageWithDescription extends StatelessWidget {
  const ImageWithDescription(
      {Key? key,
      required this.screenHeight,
      required this.screenWidth,
      required this.car})
      : super(key: key);

  final double screenHeight;
  final double screenWidth;
  final Car car;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: screenHeight * 0.45,
          width: screenWidth * 0.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25.h),
                  bottomRight: Radius.circular(90.h)),
              image: DecorationImage(
                  image: AssetImage(car.exteriorFeatures[0].image),
                  fit: BoxFit.cover)),
        ),
        Expanded(
          child: Container(
            height: screenHeight * 0.45,
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  'RENAULT MEGANE',
                  maxLines: 1,
                  style: TextStyle(
                      fontFamily: fontFamilyPoppins,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold),
                ),
                AutoSizeText(
                  car.description,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: TextStyle(
                      fontFamily: fontFamilyPoppins,
                      fontSize: 8.sp,
                      color: Colors.black.withOpacity(0.7)),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
