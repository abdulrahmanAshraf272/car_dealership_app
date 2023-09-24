import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial_example/bluetooth_provider.dart';
import 'package:flutter_bluetooth_serial_example/cars_data/cars_list.dart';
import 'package:flutter_bluetooth_serial_example/constans/constant_strings.dart';
import 'package:flutter_bluetooth_serial_example/hold_values.dart';
import 'package:flutter_bluetooth_serial_example/models/car.dart';
import 'package:flutter_bluetooth_serial_example/screens/car_details/widgets/cards.dart';
import 'package:flutter_bluetooth_serial_example/screens/car_details/widgets/image_with_description.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'dart:typed_data';

class CarDetails extends StatelessWidget {
  CarDetails({Key? key}) : super(key: key);

  late BluetoothProvider provider;

  @override
  Widget build(BuildContext context) {
    void _sendToArduinoToHome() {
      _sendMessage('h');
      print('sending arduino to home');
    }

    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: new Text(
                "هل انت متأكد ؟",
                style: TextStyle(fontFamily: fontFamilyPoppins),
              ),
              content: new Text(
                'انك قد انهيت من معاينة السيارة',
                style: TextStyle(fontFamily: fontFamilyPoppins),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text(
                    'لا',
                    style: TextStyle(fontFamily: fontFamilyPoppins),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _sendToArduinoToHome();
                    Navigator.of(context).pop(true);
                  },
                  child: new Text(
                    'نعم',
                    style: TextStyle(fontFamily: fontFamilyPoppins),
                  ),
                ),
              ],
            ),
          )) ??
          false;
    }

    final Car car = cars[HoldValues.carSelected];
    double screenWidth = MediaQuery.of(context).size.width;
    // Get the app bar height (if it exists)
    double safeAreaHeight = MediaQuery.of(context).padding.top;
    double screenHeight = MediaQuery.of(context).size.height - safeAreaHeight;
    provider = Provider.of<BluetoothProvider>(context);

    Future<void>.delayed(Duration.zero, () async {
      if (provider.connection?.isConnected == false) {
        print('the connection lost : carDetails page');
      }
    });

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                  height: screenHeight * 0.1,
                  alignment: Alignment.center,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: IconButton(
                          onPressed: () => _onWillPop(),
                          icon: const Icon(Icons.arrow_back)),
                    ),
                  )),
              ImageWithDescription(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                car: car,
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: 20,
                    left: 20,
                    top: screenHeight * 0.01,
                    bottom: screenHeight * 0.01),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'انقر على البطاقة للمزيد من التفاصيل',
                    style: TextStyle(
                        fontFamily: fontFamilyPoppins,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.8),
                        fontSize: 6.sp),
                  ),
                ),
              ),
              Spacer(),
              Cards(
                car: car,
              ),
              SizedBox(
                height: screenHeight * 0.04,
              )
            ],
          ),
        ),
      ),
    );
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
