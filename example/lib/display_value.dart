import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial_example/controllers/bluetooth_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'dart:convert';
import 'dart:typed_data';

class DisplayValue extends StatelessWidget {
  late BluetoothController bluetoothController;
  DisplayValue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bluetoothController = Get.find();

    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          children: [
            MaterialButton(
              onPressed: () {
                _sendMessage('H');
              },
              color: Colors.blue,
              child: Text('on'),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                _sendMessage('L');
              },
              color: Colors.blue,
              child: Text('off'),
            ),
            Text('${bluetoothController.getMessageReceived()}'),
            SizedBox(
              height: 20,
            ),
            bluetoothController.lostConnection
                ? Text('Lost connection')
                : SizedBox()
          ],
        ),
      ),
    ));
  }

  void _sendMessage(String text) async {
    if (text.length > 0) {
      try {
        bluetoothController.connection!.output
            .add(Uint8List.fromList(utf8.encode(text + "\r\n")));
        await bluetoothController.connection!.output.allSent;
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
