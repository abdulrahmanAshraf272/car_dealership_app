import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial_example/constans/constant_strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  final String title;
  const Header({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back)),
            ),
          ),
          Spacer(),
          Text(
            title,
            style: TextStyle(
                fontFamily: fontFamilyPoppins,
                fontWeight: FontWeight.bold,
                fontSize: 10.sp),
          ),
          Spacer(),
          SizedBox(
            width: 25.w,
          )
        ],
      ),
    );
  }
}
