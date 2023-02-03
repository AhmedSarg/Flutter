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
          title: const Text("App"),
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
  MaterialColor _clr = Colors.green;
  String _clrTitle = "Green";
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_clrTitle),
          backgroundColor: _clr,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                          Icons.email,
                        color: _clr,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          icon: Icon(
                            _passwordVisible? Icons.visibility : Icons.visibility_off,
                            color: _clr,
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: _clr,
                          style: BorderStyle.solid
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(50)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3,
                            color: _clr,
                            style: BorderStyle.solid
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(50)),
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(color: _clr),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (String? value) {
                      if (value != null && value.contains('@')) {
                        return "Don't use @";
                      }
                      return null;
                    },
                    obscureText: !_passwordVisible,
                    style: TextStyle(color: _clr),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            _clr = Colors.red;
                            _clrTitle = "Red";
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
                            _clr = Colors.green;
                            _clrTitle = "Green";
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
                            _clr = Colors.blue;
                            _clrTitle = "Blue";
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
            ],
          ),
        ),
      ),
    );
  }
}
