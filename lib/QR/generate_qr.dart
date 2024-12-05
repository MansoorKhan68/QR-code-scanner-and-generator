import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQR extends StatefulWidget {
  const GenerateQR({super.key});

  @override
  State<GenerateQR> createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {
  TextEditingController value = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // USING QR_FLUTTER PACKAGE

          value.text.isEmpty
              ? Container()
              : QrImageView(
                  data: value.text,
                  version: QrVersions.auto,
                  size: 200,
                ),
          // TEXT FIELD TO TAKE TEXT FOR GENERATING QR CODE
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: value,
              decoration:
                  const InputDecoration(hintText: "Enter value to generate QR"),
            ),
          ),

          // CREATE BUTTON TO GENERATE QR CODE BY ON PRESS

          Center(
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Generate QR"),
                  )))
        ],
      ),
    );
  }
}
