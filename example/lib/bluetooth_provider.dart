import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothProvider with ChangeNotifier {
  // final String bluetoothAddress = '98:D3:33:80:85:1A';
  BluetoothConnection? connection;

  final clientID = 0;
  // BluetoothConnection? connection;

  String _m = '';

  setValue(String m) {
    _m = m;
    notifyListeners();
  }

  String getValue() {
    return _m;
  }
}
