import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial_example/cars_data/cars_list.dart';
import 'package:flutter_bluetooth_serial_example/constans/constant_strings.dart';
import 'package:flutter_bluetooth_serial_example/screens/all_cars/widgets/car_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCarsScreen extends StatelessWidget {
  const AllCarsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenDimentions screenDimentions = ScreenDimentions(context: context);
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
