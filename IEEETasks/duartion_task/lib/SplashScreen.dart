import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              color: Colors.deepPurple
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.qr_code,
                  size: 150,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("QR Code Reader", style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Roboto', fontWeight: FontWeight.w700),),
                SizedBox(
                  height: 70,
                ),
                CircularProgressIndicator(color: Colors.white,)
              ],
            ),
          )
      ),
    );
  }
}
