import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:ui';
import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';

class GenerateScreen extends StatefulWidget {
  const GenerateScreen({Key? key}) : super(key: key);

  @override
  State<GenerateScreen> createState() => _GenerateScreenState();
}

class _GenerateScreenState extends State<GenerateScreen> {

  GlobalKey globalKey = GlobalKey();
  String data = "";
  final TextEditingController textControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bodyHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Generator", style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Roboto', fontWeight: FontWeight.w700)),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  share();
                });
              },
              icon: const Icon(Icons.share))
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            left: 20,
            right: 10,
            bottom: 20
          ),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: TextField(
                          controller: textControl,
                          decoration: const InputDecoration(
                            hintText: "Enter text to convert",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.deepPurple,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.deepPurple,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                            contentPadding: EdgeInsets.all(12)
                          )
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            data = textControl.text;
                          });
                        },
                        child: const Text("Generate", style: TextStyle(color: Colors.deepPurple, fontSize: 14, fontFamily: 'Roboto', fontWeight: FontWeight.w700),),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Center(
                    child: RepaintBoundary(
                      key: globalKey,
                      child: Container(
                        color: Colors.white,
                        child: QrImage(
                          data: data,
                          size: 0.4 * bodyHeight,
                        ),
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> share() async {
    try {
      RenderRepaintBoundary boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List? pngBytes = byteData!.buffer.asUint8List();
      final tempDir = await getExternalStorageDirectory();
      final file = await File("${tempDir?.path}/qrcode.png").create();
      await file.writeAsBytes(pngBytes);
      shareTemp(file);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> shareTemp(File file) async {
    await FlutterShare.shareFile(
        title: "Title",
        filePath: file.absolute.path,
    );
  }
}
