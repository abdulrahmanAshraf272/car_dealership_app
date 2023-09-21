import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial_example/constans/constant_strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget roundedInfo({required String title}) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Colors.black.withOpacity(0.6), width: 1)),
      child: Text(
        title,
        style: TextStyle(
            fontFamily: fontFamilyPoppins,
            fontSize: 4.sp,
            color: Colors.black.withOpacity(0.7)),
      ));
}

Widget rectInfo(
    {required String title, required int value, required String icon}) {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black.withOpacity(0.06)),
    child: Row(
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(fontFamily: fontFamilyPoppins, fontSize: 5.sp),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '$value',
              style: TextStyle(fontFamily: fontFamilyPoppins, fontSize: 5.sp),
            )
          ],
        ),
        const SizedBox(
          width: 5,
        ),
        Image.asset(
          icon,
          width: 8.w,
        ),
      ],
    ),
  );
}
