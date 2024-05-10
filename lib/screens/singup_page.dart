import 'package:eschoolaire_app/constant.dart';
import 'package:eschoolaire_app/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../helper/Firestore_helper.dart';
import '../models/user_model.dart';
import '../widgets/original_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _isPasswordVisible = false;
  bool isLoading = false;
  String? email;
  String? password;
  String? userName;
  String? confirmedPassword;
  String? phoneNumber;
  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              SizedBox(height: 20),
              const Text(
                "Sign up",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _userNameController,
                decoration: InputDecoration(
                  hintText: "Username",
                  prefixIcon: const Icon(Icons.person, color: kPrimaryColor),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a valid username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: const Icon(Icons.email, color: kPrimaryColor),
                ),
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Icon(Icons.lock, color: kPrimaryColor),
                  suffixIcon: IconButton(
                    icon: _isPasswordVisible
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
                obscureText: !_isPasswordVisible,
                validator: (value) {
                  if (value!.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  prefixIcon: const Icon(Icons.lock, color: kPrimaryColor),
                  suffixIcon: IconButton(
                    icon: _isPasswordVisible
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
                obscureText: !_isPasswordVisible,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: _phoneController,
                decoration: InputDecoration(
                  hintText: "Phone Number",
                  prefixIcon: const Icon(Icons.phone, color: kPrimaryColor),
                ),
                validator: (value) {
                  if (value!.isEmpty || value.length != 10) {
                    return 'Please enter a valid 10-digit phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              OriginalButton(
                text: 'Sign Up',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      isLoading = true;
                      // Assign values from text controllers to variables
                      email = _emailController.text;
                      password = _passwordController.text;
                      userName = _userNameController.text;
                      phoneNumber = _phoneController.text;
                    });
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .createUserWithEmailAndPassword(
                        email: email!,
                        password: password!,
                      );

                      if (userCredential.user != null) {
                        UserModel userModel = UserModel(
                          email: email!,
                          userName: userName!,
                          isAdmin: false,
                          phoneNumber: phoneNumber!,
                        );
                        await FireStoreHelper.saveUserInFirestore(userModel);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Registration successful'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                            Text('The password provided is too weak')));
                      } else if (e.code == 'email-already-in-use') {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'The account already exists for that email')));
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('incorrect data : $e')));
                    } finally {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  }
                },
                bgColor: kPrimaryColor,
                textColor: Colors.white,
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: kPrimaryColor),
                    ),
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
