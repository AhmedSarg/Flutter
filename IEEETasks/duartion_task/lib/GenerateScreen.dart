import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:typed_data';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Generator", style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Roboto', fontWeight: FontWeight.w700)),
        backgroundColor: Colors.deepPurple,
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
              Container(
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
                        onPressed: () {},
                        child: const Text("Generate", style: TextStyle(color: Colors.deepPurple, fontSize: 14, fontFamily: 'Roboto', fontWeight: FontWeight.w700),),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
