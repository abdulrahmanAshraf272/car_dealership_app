import 'package:flutter/foundation.dart';
import 'package:flutter_bluetooth_serial_example/controllers/bluetooth_controller.dart';
import 'package:get/get.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(BluetoothController());
  }
}
