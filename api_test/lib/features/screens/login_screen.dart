import 'package:api_test/core/bloc/data_cubit/data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30),
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
              padding: const EdgeInsets.only(top: 30, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<DataCubit>(context).findPassforEmail(
                              email: emailController.text,
                              password: passwordController.text);
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Login"),
                      )),
                ],
              ),
            ),
            const SelectableText("https://dummyjson.com/users")
          ],
        ));
  }
}
