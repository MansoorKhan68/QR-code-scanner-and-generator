import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:scan_qr_code/QR/generate_qr.dart';
import 'package:scan_qr_code/QR/scan_qr.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Get.to( const ScanQR());
                },
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Scan QR Code",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                )),
          ),
        const  SizedBox(height: 50,),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Get.to( const GenerateQR());
                },
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Generate QR Code",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
