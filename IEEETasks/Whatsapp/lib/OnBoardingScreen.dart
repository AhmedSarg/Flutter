import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:whatsapp/ChatScreen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Send Free Message",
            body: "whatsapp is totally free messaging app",
            image: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/WhatsApp.svg/768px-WhatsApp.svg.png")
          ),
          PageViewModel(
            title: "Connect Your Friend",
            body: "chat with your friends easily",
            decoration: const PageDecoration(
              pageColor: Color(0xFF075E54),
              titleTextStyle: TextStyle(color: Colors.white),
              bodyTextStyle: TextStyle(color: Colors.white),
            ),
          ),
          PageViewModel(
            title: "Make Group Chats",
            body: "also chat with your friends in groups easily",
            decoration: const PageDecoration(
              pageColor: Color(0xFF075E54),
              titleTextStyle: TextStyle(color: Colors.white),
              bodyTextStyle: TextStyle(color: Colors.white),
            ),
          ),
          PageViewModel(
            title: "Enter your name",
            bodyWidget: TextFormField(
              decoration: const InputDecoration(
                  hintText: "username",
                  enabledBorder:UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2)
                  )
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter a valid name";
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.name,
            ),
            decoration: const PageDecoration(
              pageColor: Color(0xFF075E54),
              titleTextStyle: TextStyle(color: Colors.white),
              bodyTextStyle: TextStyle(color: Colors.white),
            )
          )
        ],
        done: const Text(
          "DONE",
          style: TextStyle(color: Color(0xFF075E54)),
        ),
        next: const Text(
          "NEXT",
          style: TextStyle(color: Color(0xFF075E54)),
        ),
        back: const Text(
          "BACK",
          style: TextStyle(color: Color(0xFF075E54)),),
        showBackButton: true,
        showNextButton: true,
        animationDuration: 1,
        dotsDecorator: DotsDecorator(
          size: const Size.square(10),
          activeSize: const Size(20, 10),
          activeColor: const Color(0xFF075E54),
          //color: Colors.white,
          spacing: const EdgeInsets.symmetric(horizontal: 3),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
        ),
        onDone: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>const Chat()));
        },
      ),
    );
  }
}
