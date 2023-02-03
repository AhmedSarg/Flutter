import 'package:flutter/material.dart';

void main() {
  runApp(const NewApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Apppppp"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class NewApp extends StatefulWidget {
  const NewApp({Key? key}) : super(key: key);

  @override
  State<NewApp> createState() => _NewAppState();
}

class _NewAppState extends State<NewApp> {
  MaterialColor clr = Colors.green;
  String clrTitle = "Green";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(clrTitle),
          backgroundColor: clr,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        clr = Colors.red;
                        clrTitle = "Red";
                      });
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        color: Colors.red,
                        child: const Text(
                          "Red",
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ))),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        clr = Colors.green;
                        clrTitle = "Green";
                      });
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        color: Colors.green,
                        child: const Text(
                          "Green",
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ))),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        clr = Colors.blue;
                        clrTitle = "Blue";
                      });
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        color: Colors.blue,
                        child: const Text(
                          "Blue",
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
