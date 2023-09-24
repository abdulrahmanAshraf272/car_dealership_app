import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial_example/bluetooth_provider.dart';
import 'package:flutter_bluetooth_serial_example/cars_data/cars_list.dart';
import 'package:flutter_bluetooth_serial_example/constans/constant_strings.dart';
import 'package:flutter_bluetooth_serial_example/routes.dart';
import 'package:flutter_bluetooth_serial_example/screens/all_cars/widgets/car_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

class AllCarsScreen extends StatelessWidget {
  AllCarsScreen({Key? key}) : super(key: key);

  late BluetoothProvider provider;

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
        print('the connection is lost: allCars page');
        if (isWidgetVisible(context)) {
          showConnectionLostAlert();
        }
      }
    });

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Text(
              'اختر السيارة التي ترغب بها',
              style: TextStyle(
                  fontFamily: fontFamilyPoppins,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold),
            ),
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: screenDimentions.screenHeight * 0.03),
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.all(20),
                itemCount: cars.length,
                itemBuilder: (context, index) {
                  //TODO : not done
                  return CarCard(
                    car: cars[index],
                  );
                }),
          ],
        ),
      )),
    );
  }
}
