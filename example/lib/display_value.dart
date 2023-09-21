import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial_example/bluetooth_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'dart:convert';
import 'dart:typed_data';

class DisplayValue extends StatelessWidget {
  late BluetoothProvider provider;
  DisplayValue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<BluetoothProvider>(context);

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
            Text('${provider.getMessageReceived()}'),
            SizedBox(
              height: 20,
            ),
            provider.lostConnection ? Text('Lost connection') : SizedBox()
          ],
        ),
      ),
    ));
  }

  void _sendMessage(String text) async {
    if (text.length > 0) {
      try {
        provider.connection!.output
            .add(Uint8List.fromList(utf8.encode(text + "\r\n")));
        await provider.connection!.output.allSent;
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
