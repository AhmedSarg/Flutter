import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp/OnBoardingScreen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFFFFFFF),
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text(
                    "Enter your phone number",
                  style: TextStyle(
                    color: Color(0xFF075E54),
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 30),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "phone number",
                      enabledBorder:UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF075E54))
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF075E54), width: 2)
                      )
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: (value) {
                      bool isNumeric(String str) {
                        try {
                          var value = double.parse(str);
                        } on FormatException {
                          return false;
                        } finally {
                          return true;
                        }
                      }
                      if (isNumeric(value!)) {
                        return null;
                      } else {
                        return "Invalid phone number";
                      }
                    },
                  ),
                )
              ],
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OnBoarding())
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    color: Color(0xFF075E54)
                  ),
                  child: const Text(
                      "NEXT",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
