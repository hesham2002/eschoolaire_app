

import 'package:eschoolaire_app/constant.dart';
import 'package:eschoolaire_app/widgets/login_page.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: Column(
                    children: [
                     const SizedBox(
                      height: 20,
                     ),
                      Image.asset(
                        'assets/images/logo.png',
                        height: 300,
                      ),
                      const SizedBox(),
                      const Text(
                        'Welcome ',
                        
                        style: TextStyle(
                            color: kTextBlackColor,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2),
                      ),
                     
                      const Text(
                        'Login to continue',
                        style: TextStyle(
                            color:kTextLightColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.2),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
               


              ],
            ),
            const loginPage(),
          ],
        ),
      ),
    );
  }
}
