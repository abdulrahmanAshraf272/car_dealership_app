import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial_example/constans/constant_strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowMeCarButton extends StatelessWidget {
  final Function() onPress;
  const ShowMeCarButton({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenDimentions screenDimentions = ScreenDimentions(context: context);
    return Container(
      width: 90.w,
      height: screenDimentions.screenHeight * 0.1,
      decoration: BoxDecoration(
        color: Color(0xFF212121),
        borderRadius: BorderRadius.circular(6.w),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.w),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPress,
            child: Container(
              width: 90.w,
              height: screenDimentions.screenHeight * 0.1,
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'اريد رؤية السيارة',
                      style: TextStyle(
                          fontFamily: fontFamilyPoppins,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 8.sp),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GoBackButton extends StatelessWidget {
  final Function() onPress;
  const GoBackButton({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenDimentions screenDimentions = ScreenDimentions(context: context);

    return Container(
      width: 90.w,
      height: screenDimentions.screenHeight * 0.1,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6.w),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.w),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPress,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 7.w),
              width: 90.w,
              height: screenDimentions.screenHeight * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 9.w,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Expanded(
                    child: Text(
                      'رجوع الى القائمة',
                      style: TextStyle(
                          fontFamily: fontFamilyPoppins,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 8.sp),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
