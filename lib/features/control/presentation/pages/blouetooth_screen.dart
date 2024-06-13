//
// import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BluetoothScreen(),
    );
  }
}

class BluetoothScreen extends StatefulWidget {
  @override
  _BluetoothScreenState createState() => _BluetoothScreenState();
}

class _BluetoothScreenState extends State<BluetoothScreen> {
  //===============================================================================================
  //native
  static const platform = MethodChannel('samples.flutter.dev/sensors');
  String _accelerometerData = 'Unknown';

  Future<void> _getAccelerometerData() async {
    String accelerometerData;
    try {
      final String result = await platform.invokeMethod('getAccelerometerData');
      accelerometerData = 'Accelerometer data: $result';
    } on PlatformException catch (e) {
      accelerometerData = "Failed to get accelerometer data: '${e.message}'.";
    }
    print(accelerometerData);
    setState(() {
      _accelerometerData = accelerometerData;
    });
  }

  //===============================================================================================
  List<BluetoothDevice> _devicesList = [];
  late BluetoothDevice _device;
  late BluetoothConnection _connection;
  bool _isConnecting = false;
  bool _isConnected = false;
  String _receivedData = '';

  @override
  void initState() {
    super.initState();
    _getPairedDevices();
    // _getAccelerometerData();
  }

  Future<void> _getPairedDevices() async {
    List<BluetoothDevice> devices = [];
    try {
      devices = await FlutterBluetoothSerial.instance.getBondedDevices();
    } catch (ex) {
      print(ex);
    }
    setState(() {
      _devicesList = devices;
    });
  }

  Future<void> _connectToDevice(BluetoothDevice device) async {
    setState(() {
      _isConnecting = true;
      _device = device;
    });

    try {
      print(device.address);
      print(device.bondState);
      print(device.type);
      BluetoothConnection connection =
          await BluetoothConnection.toAddress(device.address);
      setState(() {
        _isConnecting = false;
        _isConnected = true;
        _connection = connection;
      });
      print(device.isConnected);
      // Send data
      _connection.output
          .add(Uint8List.fromList(utf8.encode("Hello, Arduino!")));
      await _connection.output.allSent;

      // Listen for incoming data
      _connection.input!.listen(_onDataReceived).onData((data) {
        print(data);
      });
      // _connection.input!.listen(_onDataReceived).onDone(() {
      //   setState(() {
      //     _isConnected = false;
      //   });
      // });
    } catch (ex) {
      print(ex);
    }
  }

  void _onDataReceived(Uint8List data) {
    print("Received: ${utf8.decode(data)}");
    setState(() {
      _receivedData = String.fromCharCodes(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bluetooth Connection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Paired Devices:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Column(
              children: _devicesList.map((device) {
                return ListTile(
                  title: Text('${device.name}'),
                  onTap: () => _connectToDevice(device),
                );
              }).toList(),
            ),
            _isConnecting
                ? const CircularProgressIndicator()
                : _isConnected
                    ? Text('Connected to ${_device.name}')
                    : const SizedBox(),
            const SizedBox(height: 20),
            Text('Received Data: $_receivedData'),
          ],
        ),
      ),
    );
  }
}

// import 'package:final_project/shared/styles/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
//
//
// class BluetoothScreen extends StatefulWidget {
//   const BluetoothScreen({super.key});
//
//   @override
//   BluetoothScreenState createState() => BluetoothScreenState();
// }
//
// class BluetoothScreenState extends State<BluetoothScreen> {
//   List<BluetoothDevice> _devices = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _getPairedDevices();
//   }
//
//   Future<void> _getPairedDevices() async {
//     List<BluetoothDevice> devices = [];
//     try {
//       devices = await FlutterBluetoothSerial.instance.getBondedDevices();
//     } catch (e) {
//       print("Error: $e");
//     }
//
//     setState(() {
//       _devices = devices;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: MyColors.mainColor,
//         title: const Text('Bluetooth Devices'),
//       ),
//       body: ListView.builder(
//         itemCount: _devices.length,
//         itemBuilder: (context, index) {
//           BluetoothDevice device = _devices[index];
//           return ListTile(
//             title: Text("${device.name}"),
//             subtitle: Text(device.address),
//             onTap: () {
//               _connectToDevice(device);
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   Future<void> _connectToDevice(BluetoothDevice device) async {
//     try {
//       await FlutterBluetoothSerial.instance.requestEnable();
//       print('Connected to ${device.name}');
//     } catch (e) {
//       print("Error: $e");
//     }
//   }
// }

// class BluetoothScreen extends StatefulWidget {
//   const BluetoothScreen({super.key});
//
//   @override
//   State<BluetoothScreen> createState() => _BluetoothScreenState();
// }
//
// class _BluetoothScreenState extends State<BluetoothScreen> {
//   BluetoothConnection? _connection;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Bluetooth Connection'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             // Check if Bluetooth is available
//             BluetoothState bluetoothState = await FlutterBluetoothSerial.instance.state;
//             print(bluetoothState.toString());
//             if (bluetoothState == BluetoothState.STATE_ON) {
//               // Discover devices
//               List<BluetoothDevice> devices = await FlutterBluetoothSerial.instance.getBondedDevices();
//               print(devices.length);
//               // Connect to a device
//               _connection = await BluetoothConnection.toAddress(devices[0].address);
//
//               // Send data
//               _connection!.output.add( Uint8List.fromList(utf8.encode("Hello, Arduino!")));
//               await _connection!.output.allSent;
//
//               // Listen for incoming data
//               _connection!.input!.listen((Uint8List data) {
//                 print("Received: ${utf8.decode(data)}");
//               });
//             } else {
//               print("Bluetooth is not available");
//             }
//           },
//           child: const Text('Connect to Bluetooth Device'),
//         ),
//       ),
//     );
//   }
// }
