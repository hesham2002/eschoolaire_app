

import 'package:eschoolaire_app/constant.dart';
import 'package:eschoolaire_app/widgets/bottonnavigator_screen.dart';
import 'package:eschoolaire_app/widgets/original_button.dart';
import 'package:eschoolaire_app/widgets/singup_page.dart';
import 'package:flutter/material.dart';





// ignore: camel_case_types
class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}



// ignore: camel_case_types
class _loginPageState extends State<loginPage> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter a valide mail';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.mail,
                        color: kPrimaryColor,
                      ),
                      labelText: 'Enter your mail',
                      hintText: 'Ex:test@.com'),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.length < 6) {
                      return 'you passeword must be larger then 6 characters';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color:kPrimaryColor,
                    ),
                    labelText: 'Enter your password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                OriginalButton(
                    text: 'Login',
                    onPressed: () {
                       if (_formkey.currentState!.validate()) {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => const BottomNavigationBarExample()),
                         
                        );
                      }
                    },
                    textColor: kTextWhiteColor,
                    bgColor: kPrimaryColor,),
                 const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  const SignupPage()),
                      );
                    },
                    child: const Text(
                      "don't have an account!",
                      style: TextStyle(color: kTextBlackColor, fontSize: 18),
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}


