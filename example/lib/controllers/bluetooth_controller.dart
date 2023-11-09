import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothController extends GetxController {
  // final String bluetoothAddress = '98:D3:33:80:85:1A';
  BluetoothConnection? connection;
  String _messageReceived = '';
  final clientID = 0;
  bool _lostConnection = false;
  bool _connected = false;

  bool get lostConnection => _lostConnection;
  set lostConnection(bool value) {
    _lostConnection = value;
    update();
  }

  bool get connected => _connected;
  set connected(bool value) {
    _connected = value;
    update();
  }

  setMessageReceived(String m) {
    _messageReceived = m;
    update();
  }

  String getMessageReceived() {
    return _messageReceived;
  }
}
