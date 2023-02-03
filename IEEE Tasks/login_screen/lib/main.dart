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
          title: const Text("Login Screen"),
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
  bool _passwordVisible = false;
  String _email = "", _password = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.deepPurple,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  RotationTransition(
                    turns: AlwaysStoppedAnimation(-40/360),
                    child: Text(
                        "E",
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w800,
                        fontSize: 125,
                      ),
                    ),
                  ),
                  Text(
                      "  ECORP",
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 50
                    ),
                  )
                ],
              ),
              Container(
                width: 300,
                height: 300,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: Colors.grey,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3,
                                  color: Colors.white,
                                  style: BorderStyle.solid
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3,
                                  color: Colors.white,
                                  style: BorderStyle.solid
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                            ),
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.black12,
                          ),
                          validator: (String? value) {
                            if (value != null && !value.contains('@')) {
                              return "Type Correct Email";
                            }
                            return null;
                          },
                          onSaved: (String? value) {
                            _email = value!;
                          },
                          obscureText: false,
                          style: const TextStyle(color: Colors.black),
                          keyboardType: TextInputType.emailAddress,
                        ),
                    TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                                icon: Icon(
                                  _passwordVisible? Icons.visibility : Icons.visibility_off,
                                  color: Colors.grey,
                                )
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3,
                                  color: Colors.white,
                                  style: BorderStyle.solid
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3,
                                  color: Colors.white,
                                  style: BorderStyle.solid
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                            ),
                            hintText: "Password",
                            hintStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.black12,
                          ),
                          validator: (String? value) {
                            if (value != null && value.length < 8) {
                              return "Type Correct Password";
                            }
                            return null;
                          },
                          onSaved: (String? value) {
                            _password = value!;
                          },
                          obscureText: !_passwordVisible,
                          style: const TextStyle(color: Colors.black),
                          keyboardType: TextInputType.emailAddress,
                        ),
                    TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.grey),
                            )
                        ),
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              color: Colors.deepPurple
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 20),
                            child: const Center(
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400
                                ),
                              ),
                            )
                          )
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "SIGNUP",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500
                            ),
                          )
                        )
                      ],
                    )
                  ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}