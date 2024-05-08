

import 'package:eschoolaire_app/constant.dart';
import 'package:flutter/material.dart';


import 'login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Column(
                children: <Widget>[
                  SizedBox(height: 60.0),
                  Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create your account",
                    style: TextStyle(fontSize: 15, color: kTextBlackColor),
                  )
                ],
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter a valide Username';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "Username",
                          prefixIcon: Icon(
                            Icons.person,
                            color: kPrimaryColor,
                          )),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter a valide mail';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(
                            Icons.email,
                            color: kPrimaryColor,
                          )),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _pass,
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'you passeword must be larger then 6 characters';
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(
                          Icons.password,
                          color: kPrimaryColor,
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _confirmPass,
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'you passeword must be larger then 6 characters';
                        }
                        if (value != _pass.text) {
                          return 'Not Match';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Confirm Password",
                        prefixIcon: Icon(
                          Icons.password,
                          color: kPrimaryColor,
                        ),
                      ),
                      obscureText: true,
                      
                    ),
                    const SizedBox(height: 20),
                     TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter a valide PHone Number';
                        }
                         if (value.length != 10){
                          return 'Mobile Number must be of 10 digit';
                         }
                       return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "PhoneNumber",
                          prefixIcon: Icon(
                            Icons.phone,
                            color: kPrimaryColor,
                          )),
                    ),
                     
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 3, left: 3),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: kPrimaryColor,
                    ),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(fontSize: 20, color: kTextWhiteColor),
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Already have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const loginPage()),
                        );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: kPrimaryColor),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}