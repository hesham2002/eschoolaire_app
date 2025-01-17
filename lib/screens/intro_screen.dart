

import 'package:eschoolaire_app/constant.dart';
import 'package:eschoolaire_app/screens/login_page.dart';
import 'package:eschoolaire_app/widgets/original_button.dart';
import 'package:flutter/material.dart';







class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Image.asset('assets/images/logo.png',),
              OriginalButton(
              text: 'Get started ',
              onPressed: () { 
                Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
              );
               },
               bgColor: kPrimaryColor, 
               textColor: kTextWhiteColor,

             ), 
             const SizedBox(),
              
            ],
          ),
        ),
      ),
    );
  }
}
