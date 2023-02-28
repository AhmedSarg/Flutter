import 'package:flutter/material.dart';
import 'GenerateScreen.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code Reader", style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Roboto', fontWeight: FontWeight.w700)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.white
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton (
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const GenerateScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  textStyle: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Roboto', fontWeight: FontWeight.w700),
                  side: const BorderSide(color: Colors.black12, style: BorderStyle.solid, strokeAlign: StrokeAlign.outside, width: 3),
                  fixedSize: const Size(150, 40),
                  elevation: 7,
                ),
                child: const Text("Generate"),
              ),
              const SizedBox(height: 30),
              ElevatedButton (
                onPressed: () {
                  scan();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  textStyle: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Roboto', fontWeight: FontWeight.w700),
                  side: const BorderSide(color: Colors.black12, style: BorderStyle.solid, strokeAlign: StrokeAlign.outside, width: 3),
                  fixedSize: const Size(150, 40),
                  elevation: 7,
                ),
                child: const Text("Scan"),
              ),
              const SizedBox(height: 30,),
              Stack(
                children: [
                  Text(
                      "By Ahmed Sarg",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2
                          ..color = Colors.deepPurple,
                      )
                  ),
                  const Text(
                      "By Ahmed Sarg",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future scan() async {
    String result = "";
    try {
      ScanResult qr = await BarcodeScanner.scan();
      setState(() {
        result = qr.rawContent;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result = "Grant Camera Permission";
        });
      }
      else {
        setState(() {
          result = "Unknown Error $e";
        });
      }
    } on FormatException {
      setState(() {
        result = "No QR Code Scanned";
      });
    } catch (e) {
      setState(() {
        result = "Unknown Error $e";
      });
    }
    if (result != "Grant Camera Permission" && result != "No QR Code Scanned" && result != "" && !result.contains("Unknown Error")) {
      _showMyDialog(result);
    }
  }

  Future<void> _showMyDialog(String result) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Result : "),
          content: SingleChildScrollView(
            child: Text(result),
          ),
          actions: result.contains("http") == false ?
          <Widget>[
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 13,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ] :
          <Widget>[
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 13,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'OPEN',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 13,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                ),
              ),
              onPressed: () async {
                if (await canLaunchUrl(Uri.parse(result))) {
                  await launchUrl(Uri.parse(result), mode: LaunchMode.externalApplication);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
