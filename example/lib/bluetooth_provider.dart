import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothProvider with ChangeNotifier {
  // final String bluetoothAddress = '98:D3:33:80:85:1A';
  BluetoothConnection? connection;

  final clientID = 0;
  // BluetoothConnection? connection;

  bool _lostConnection = false;
  bool get lostConnection => _lostConnection;
  set lostConnection(bool value) {
    _lostConnection = value;
    notifyListeners();
  }

  bool _connected = false;
  bool get connected => _connected;
  set connected(bool value) {
    _connected = value;
    notifyListeners();
  }

  String _messageReceived = '';

  setMessageReceived(String m) {
    _messageReceived = m;
    notifyListeners();
  }

  String getMessageReceived() {
    return _messageReceived;
  }
}
