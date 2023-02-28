import 'package:flutter/cupertino.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {

  String qr = "";

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
