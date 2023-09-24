import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial_example/bluetooth_provider.dart';
import 'package:flutter_bluetooth_serial_example/cars_data/cars_list.dart';
import 'package:flutter_bluetooth_serial_example/constans/constant_strings.dart';
import 'package:flutter_bluetooth_serial_example/constans/my_colors.dart';
import 'package:flutter_bluetooth_serial_example/hold_values.dart';
import 'package:flutter_bluetooth_serial_example/models/car.dart';
import 'package:flutter_bluetooth_serial_example/routes.dart';
import 'package:flutter_bluetooth_serial_example/screens/confirm_screen/widgets/buttons.dart';
import 'package:flutter_bluetooth_serial_example/screens/all_cars/widgets/info_boxes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:quickalert/quickalert.dart';

class ConfirmScreen extends StatelessWidget {
  late BluetoothProvider provider;
  BluetoothConnection? connection;
  ConfirmScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<BluetoothProvider>(context);
    connection = provider.connection;
    final Car car = cars[HoldValues.carSelected];
    double screenHeight = MediaQuery.of(context).size.height;
    ScreenDimentions screenDimentions = ScreenDimentions(context: context);

    void showConnectionLostAlert() {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.warning,
          title: "انقطع الإتصال بالروبوت",
          text: "قم بإعادة الاتصال مرة اخرى",
          confirmBtnText: "حسنا",
          confirmBtnColor: Colors.black,
          onConfirmBtnTap: () =>
              Get.until((route) => route.settings.name == RoutesClass.home));
    }

    // Function to check if the widget is currently visible on the screen
    bool isWidgetVisible(BuildContext context) {
      final RenderBox renderBox = context.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);
      final screenSize = MediaQuery.of(context).size;

      // Check if the widget is fully or partially visible on the screen
      return position.dy >= 0 && position.dy <= screenSize.height;
    }

    Future<void>.delayed(Duration.zero, () async {
      if (provider.connection?.isConnected == false) {
        print('the connection is lost: confirm  page');

        if (isWidgetVisible(context)) {
          showConnectionLostAlert();
        }
      }
    });

    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        height: screenDimentions.screenHeight,
        width: screenDimentions.screenWidth,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Positioned(
                child: SizedBox(
              height: screenDimentions.screenHeight * 0.4,
              child: AutoSizeText(car.name,
                  maxLines: 1,
                  style: TextStyle(
                      fontFamily: fontFamilyPoppins,
                      fontSize: 60.sp,
                      fontWeight: FontWeight.bold,
                      color: MyColors.grey.withOpacity(0.6))),
            )),
            Positioned(
                right: 0,
                left: 0,
                bottom: -screenDimentions.screenHeight * 0.1,
                child: Container(
                  height: screenDimentions.screenHeight * 0.71,
                  padding: EdgeInsets.only(
                      top: screenDimentions.screenHeight * 0.17,
                      right: 15.w,
                      left: 15.w,
                      bottom: screenDimentions.screenHeight * 0.12),
                  margin: EdgeInsets.symmetric(horizontal: 27.w),
                  decoration: BoxDecoration(
                      color: MyColors.grey,
                      borderRadius: BorderRadius.circular(23.w)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenHeight * 0.08,
                        child: AutoSizeText(
                          car.fullName,
                          maxLines: 1,
                          style: TextStyle(
                              fontFamily: fontFamilyPoppins,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: screenDimentions.screenHeight * 0.01,
                      ),
                      SizedBox(
                        width: 200.w,
                        height: screenHeight * 0.088,
                        child: AutoSizeText(
                          smallDescription,
                          minFontSize: 8,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: fontFamilyPoppins,
                              fontSize: 6.sp,
                              color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      SizedBox(
                        height: screenDimentions.screenHeight * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          roundedInfo(title: '${car.year}'),
                          SizedBox(
                            width: 4.w,
                          ),
                          roundedInfo(title: '${car.cc} cc'),
                        ],
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GoBackButton(
                            onPress: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          ShowMeCarButton(
                            onPress: () {
                              Get.toNamed(RoutesClass.smileFaceScreen,
                                  arguments: connection);
                              //_sendMessage(HoldValues.carSelected.toString());
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
            Positioned(
                top: screenDimentions.screenHeight * 0.19,
                child: Hero(
                  tag: 'car-image-${car.id}',
                  child: Image.asset(
                    car.imageWithoutBackground,
                    height: screenDimentions.screenHeight * 0.4,
                  ),
                ))
          ],
        ),
      ),
    ));
  }

  void _sendMessage(String text) async {
    if (text.length > 0) {
      try {
        provider.connection!.output
            .add(Uint8List.fromList(utf8.encode(text + "\r\n")));
        await provider.connection!.output.allSent;
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
