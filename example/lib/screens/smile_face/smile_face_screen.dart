import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial_example/constans/constant_strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmileFaceScreen extends StatelessWidget {
  const SmileFaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenDimentions screenDimentions = ScreenDimentions(context: context);
    return Scaffold(
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
                      Container(
                        width: 45.w, // Adjust the size as needed
                        height: 45.w, // Adjust the size as needed
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black, // Change the color as needed
                        ),
                      ),
                      SizedBox(
                        width: 130.w,
                      ),
                      Container(
                        width: 45.w, // Adjust the size as needed
                        height: 45.w, // Adjust the size as needed
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black, // Change the color as needed
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
    );
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
