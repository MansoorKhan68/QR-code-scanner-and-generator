import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class ScanQR extends StatefulWidget {
  const ScanQR({super.key});

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  String scannedResult = "";

  // START SCAN FUNCTION 
  Future<void> startScan() async {
    String result;
    try {
      result = await FlutterBarcodeScanner.scanBarcode(
        '#FFFFFF',
        'Cancel',
        true,
        ScanMode.QR,
      );
      if (result == '-1') {
        // This means the user canceled the scan
        result = 'Scan canceled';
      }
    } on PlatformException catch (e) {
      result = "Failed to get platform version.";
      Get.snackbar('Error Occurred', e.code);
    } catch (e) {
      result = "An error occurred.";
      Get.snackbar("Error Occurred", e.toString());
    }

    if (!mounted) return;

    setState(() {
      scannedResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Scanned value - $scannedResult",
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: ElevatedButton(
              onPressed: startScan,
              child:const Text(
                "Start Scan",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
