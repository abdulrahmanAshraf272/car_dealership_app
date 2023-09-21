import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial_example/constans/constant_strings.dart';
import 'package:flutter_bluetooth_serial_example/hold_values.dart';
import 'package:flutter_bluetooth_serial_example/models/car.dart';
import 'package:flutter_bluetooth_serial_example/routes.dart';
import 'package:flutter_bluetooth_serial_example/screens/all_cars/widgets/info_boxes.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CarCard extends StatelessWidget {
  final Car car;
  const CarCard({Key? key, required this.car}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    ScreenDimentions screenDimentions = ScreenDimentions(context: context);

    return GestureDetector(
      onTap: () {
        HoldValues.carSelected = car;
        Get.toNamed(RoutesClass.confirmScreen);
      },
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 90.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.w),
                  color: const Color(0xFFf9f9f9),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, -2),
                      blurRadius: 6,
                      spreadRadius: 2,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      offset: const Offset(0, 4),
                      blurRadius: 6,
                      spreadRadius: 2,
                    ),
                  ]),
              child: Column(
                children: [
                  Expanded(child: SizedBox()),
                  Padding(
                    padding: EdgeInsets.all(6.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              car.fullName,
                              style: TextStyle(
                                  fontFamily: fontFamilyPoppins,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            rectInfo(
                                title: 'مقاعد',
                                value: car.seatsNo,
                                icon: 'assets/icons/car_seat.png')
                          ],
                        ),
                        SizedBox(
                          height: screenDimentions.screenHeight * 0.014,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            roundedInfo(title: '${car.year}'),
                            SizedBox(
                              width: 4.w,
                            ),
                            roundedInfo(title: '${car.cc} cc'),
                            Spacer(),
                            rectInfo(
                                title: 'حصان',
                                value: car.hp,
                                icon: 'assets/icons/engine.png'),
                            SizedBox(
                              width: 5.w,
                            ),
                            rectInfo(
                                title: 'كلم/س',
                                value: car.topSpeed,
                                icon: 'assets/icons/speed_gauge.png'),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              child: SizedBox(
                height: screenWidth / 2 - screenWidth * 0.3,
                child: Image.asset(
                  car.imageWithoutBackground,
                ),
              ))
        ],
      ),
    );
  }
}
