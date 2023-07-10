import 'package:api_test/core/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool hidePass = true;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text("Data from API"),
          ),
          body: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50.0, vertical: 50),
                    child: TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          return null;
                        } else {
                          return "enter email";
                        }
                      },
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email),
                          labelText: "email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50.0, vertical: 50),
                    child: TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          return null;
                        } else {
                          return "enter password";
                        }
                      },
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            FontAwesomeIcons.lock,
                            size: 20,
                          ),
                          suffixIcon: IconButton(
                            iconSize: 18,
                            icon: (hidePass
                                ? const Icon(
                                    FontAwesomeIcons.eyeSlash,
                                  )
                                : const Icon(FontAwesomeIcons.eye)),
                            onPressed: () {
                              hidePass = !hidePass;
                              setState(() {});
                            },
                          ),
                          labelText: "password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14))),
                      obscureText: hidePass,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                UserService()
                                    .findPassforEmail(
                                        email: emailController.text,
                                        password: passwordController.text)
                                    .then((value) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text("Message"),
                                          content: Text(value),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text("OK"))
                                          ],
                                        );
                                      });
                                });
                              }
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text("Login"),
                            )),
                        /*ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Message"),
                                      content: const Text("Signup Succesfully"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text("OK"))
                                      ],
                                    );
                                  });
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("Signup"),
                          ))*/
                      ],
                    ),
                  )
                ],
              )),
        ),
        loading
            ? Center(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: const Color(0xaa000000),
                  child: const Center(child: CircularProgressIndicator()),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
