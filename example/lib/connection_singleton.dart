import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class ConnectionSingleton {
  ConnectionSingleton._internal();

  static final ConnectionSingleton _instance = ConnectionSingleton._internal();

  factory ConnectionSingleton() {
    return _instance;
  }

  static BluetoothConnection? connection;
}
