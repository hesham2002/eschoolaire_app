import 'package:eschoolaire_app/screens/singup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../widgets/bottonnavigator_screen.dart';
import '../widgets/original_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  String? email;
  String? password;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 70),
              Text(
                'Login',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/images/logo.png',
                height: 200,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail, color: kPrimaryColor),
                        labelText: 'Email',
                        hintText: 'Enter your email',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock, color: kPrimaryColor),
                        labelText: 'Password',
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    OriginalButton(
                      text: 'Login',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            UserCredential user = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: email!,
                              password: password!,
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('login Successfully')),
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const BottomNavigationBarExample(),
                              ),
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          'No user found for that email')));
                            } else if (e.code == 'wrong-password') {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      'Wrong password provided for that user')));
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('There was an error: $e')));
                          }
                          setState(() {
                            isLoading = false;
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'Please fix the errors before submitting')));
                        }
                      },
                      bgColor: kPrimaryColor,
                      textColor: Colors.white,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpPage()),
                            );
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
