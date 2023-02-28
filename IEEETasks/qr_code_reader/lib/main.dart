import 'package:qr_code_reader/SelectionScreen.dart';
import 'package:qr_code_reader/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Code Reader',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var s = Stream.periodic(const Duration(seconds: 5), (x) => x);
  String qr = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: s,
        builder: (context, snapshot) {
          return snapshot.connectionState != ConnectionState.waiting ?
          const SelectionScreen() :
          const SplashScreen();
        },
      ),
    );
  }

}