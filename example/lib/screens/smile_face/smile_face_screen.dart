import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial_example/bluetooth_provider.dart';
import 'package:flutter_bluetooth_serial_example/constans/constant_strings.dart';
import 'package:flutter_bluetooth_serial_example/hold_values.dart';
import 'package:flutter_bluetooth_serial_example/routes.dart';
import 'package:flutter_bluetooth_serial_example/screens/car_details/car_details_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'dart:typed_data';

class SmileFaceScreen extends StatefulWidget {
  SmileFaceScreen({Key? key}) : super(key: key);

  @override
  State<SmileFaceScreen> createState() => _SmileFaceScreenState();
}

class _SmileFaceScreenState extends State<SmileFaceScreen> {
  late BluetoothProvider provider;

  dynamic connection;

  void sendArduinoToCar() {
    _sendMessage(HoldValues.carSelected.toString());
  }

  void waitingForArduinoResponse(BuildContext context) async {
    if (provider.getMessageReceived() == 'c') {
      Get.toNamed(RoutesClass.carDetailsScreen);
      // int x = 0;
      // x = await Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => CarDetails()));
      // if (x == 1) {
      //   sendToArduinoToHome();
      // }
    } else if (provider.getMessageReceived() == 'h') {
      Get.until((route) => route.settings.name == RoutesClass.welcomeScreen);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Access the argument passed from the previous page
    connection = Get.arguments;
    sendArduinoToCar();
  }

  @override
  Widget build(BuildContext context) {
    ScreenDimentions screenDimentions = ScreenDimentions(context: context);
    provider = Provider.of<BluetoothProvider>(context);

    Future<void>.delayed(Duration.zero, () async {
      if (provider.getMessageReceived() == 'c') {
        Get.toNamed(RoutesClass.carDetailsScreen);
        provider.setMessageReceived('');
      }

      if (provider.getMessageReceived() == 'h') {
        Get.until((route) => route.settings.name == RoutesClass.welcomeScreen);
        provider.setMessageReceived('');
      }
    });

    //To prevent the use from pop from this screen, will damage the operation ,he have to wait.
    Future<bool> _onWillPop() async {
      return false;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Positioned(
                top: screenDimentions.screenHeight * 0.25,
                right: 0,
                left: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            //sendToArduinoToCar();
                          },
                          child: Container(
                            width: 45.w, // Adjust the size as needed
                            height: 45.w, // Adjust the size as needed
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black, // Change the color as needed
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 130.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RoutesClass.carDetailsScreen);
                          },
                          child: Container(
                            width: 45.w, // Adjust the size as needed
                            height: 45.w, // Adjust the size as needed
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black, // Change the color as needed
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenDimentions.screenHeight * 0.2,
                    ),
                    Container(child: UpsideDownTriangleWidget())
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _sendMessage(String text) async {
    if (text.length > 0) {
      try {
        connection!.output.add(Uint8List.fromList(utf8.encode(text + "\r\n")));
        await connection!.output.allSent;
      } catch (e) {
        print(e.toString());
      }
    }
  }
}

class UpsideDownTriangleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return CustomPaint(
      size: Size(75.w, screenHeight * 0.35), // Adjust the size as needed
      painter: UpsideDownTrianglePainter(),
    );
  }
}

class UpsideDownTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black // Change the color as needed
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0); // Start at the top-left corner
    path.lineTo(size.width / 2, size.height / 2.5); // Draw to the bottom-center
    path.lineTo(size.width, 0); // Draw to the top-right corner
    path.close(); // Close the path to complete the upside-down triangle

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
