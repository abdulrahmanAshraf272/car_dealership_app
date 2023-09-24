import 'package:auto_size_text/auto_size_text.dart';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial_example/bluetooth_provider.dart';
import 'package:flutter_bluetooth_serial_example/constans/constant_strings.dart';
import 'package:flutter_bluetooth_serial_example/hold_values.dart';
import 'package:flutter_bluetooth_serial_example/models/feature.dart';
import 'package:flutter_bluetooth_serial_example/routes.dart';
import 'package:flutter_bluetooth_serial_example/screens/car_specifications/widgets/header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import 'package:quickalert/quickalert.dart';

class CarSpecification extends StatefulWidget {
  CarSpecification({Key? key}) : super(key: key);

  @override
  State<CarSpecification> createState() => _CarSpecificationState();
}

class _CarSpecificationState extends State<CarSpecification> {
  late PageController _pageController;
  int initialPage = 1;
  late final String title;
  late final List<Feature> features;

  late BluetoothProvider provider;

  @override
  void initState() {
    title = HoldValues.titleCardSelected;
    features = HoldValues.featuresListSelected;
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
        //so that we can have small portion show on lift and right.
        viewportFraction: 0.6,
        //by default out recipe
        initialPage: initialPage);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenDimentions screenDimentions = ScreenDimentions(context: context);

    provider = Provider.of<BluetoothProvider>(context);

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
        print('the connection is lost: car specification page');
        if (isWidgetVisible(context)) {
          showConnectionLostAlert();
        }
      }
    });

    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: screenDimentions.screenWidth,
        child: Column(
          children: [
            Header(title: title),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0),
              child: Container(
                height: screenDimentions.screenHeight * 0.65,
                width: screenDimentions.screenWidth,
                child: PageView.builder(
                    onPageChanged: ((value) {
                      setState(() {
                        initialPage = value;
                      });
                    }),
                    controller: _pageController,
                    itemCount: features.length,
                    itemBuilder: ((context, index) => buildCarSlider(index))),
              ),
            ),
            SizedBox(
              height: screenDimentions.screenHeight * 0.04,
            ),
            GestureDetector(
              onTap: () {
                Get.until(
                  (route) => Get.currentRoute == RoutesClass.confirmScreen,
                );
              },
              child: DotsIndicator(
                dotsCount: features.length,
                position: initialPage,
                decorator: DotsDecorator(
                  color: Colors.black.withOpacity(0.4), // Inactive color
                  activeColor: Colors.black.withOpacity(0.9),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  Widget buildCarSlider(int index) {
    ScreenDimentions screenDimentions = ScreenDimentions(context: context);
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0;
        if (_pageController.position.haveDimensions) {
          value = index - _pageController.page!.toDouble();
          // we use 0.038 because 180 * 0.038 = 7 almost and we need to rotate
          //our card 7 degree.
          //we clamp so that our value vary from -1 to 1
          value = (value * 0.0).clamp(-1, 1);
        }
        return AnimatedOpacity(
          duration: Duration(milliseconds: 200),
          opacity: initialPage == index ? 1 : 0.4,
          child: Transform.rotate(
              angle: math.pi * value,
              child: Column(
                children: [
                  Container(
                    height: screenDimentions.screenHeight * 0.4,
                    margin: EdgeInsets.symmetric(
                      horizontal: 40,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: AssetImage('assets/images/car_image2.jpg'),
                            fit: BoxFit.fitWidth)),
                  ),
                  SizedBox(
                    height: screenDimentions.screenHeight * 0.02,
                  ),
                  AutoSizeText(
                    features[index].title,
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: fontFamilyPoppins,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: initialPage == index
                            ? Colors.black
                            : Colors.black.withOpacity(0)),
                  ),
                  SizedBox(
                    height: screenDimentions.screenHeight * 0.01,
                  ),
                  Expanded(
                    child: AutoSizeText(
                      features[index].subtitle,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: fontFamilyPoppins,
                          fontSize: 7.sp,
                          color: initialPage == index
                              ? Colors.black.withOpacity(0.8)
                              : Colors.black.withOpacity(0)),
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
