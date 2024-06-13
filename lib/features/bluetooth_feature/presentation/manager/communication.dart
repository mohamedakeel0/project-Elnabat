import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class Communication {
  //Bluetooth
  FlutterBluetoothSerial? fls;
  BluetoothConnection? connection;
  BluetoothState bluetoothState = BluetoothState.UNKNOWN;
  String result = '';

  // Connect to the device via Bluetooth
  Future<void> connectBl(address) async {
    await BluetoothConnection.toAddress(address).then((connection) {
      debugPrint('Connected to the device');
      this.connection = connection;

      // Creates a listener to receive data
      this.connection!.input!.listen(onDataReceived).onDone(() {});
    }).catchError((error) {
      debugPrint('Cannot connect, exception occured');
    });
  }

  // When receive information
  void onDataReceived(Uint8List data) {
    // Allocate buffer for parsed data
    int backspacesCounter = 0;
    for (var byte in data) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    }
    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    int bufferIndex = buffer.length;

    // Apply backspace control character
    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
      } else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
        } else {
          buffer[--bufferIndex] = data[i];
        }
      }
    }

    // Create message if there is new line character
    result = String.fromCharCodes(buffer);
  }

  // To send Message
  Future<void> sendMessage(String text) async {
    text = text.trim();

    if (text.isNotEmpty) {
      try {
        final Uint8List unit8List =
            Uint8List.fromList(utf8.encode("$text\r\n"));
        connection!.output.add(unit8List);
        await connection!.output.allSent;
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  Future<void> dispose() async {
    fls!.setPairingRequestHandler(null);
    if (connection!.isConnected) {
      connection!.dispose();
      connection = null;
    }
  }
}
