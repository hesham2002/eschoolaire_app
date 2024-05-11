
import 'package:eschoolaire_app/constant.dart';
import 'package:eschoolaire_app/firebase_options.dart';
import 'package:eschoolaire_app/profil/admin/home_admin_screen.dart';
import 'package:eschoolaire_app/profil/parents/home_parent_screen.dart';
import 'package:eschoolaire_app/profil/teachers/home_teachers_screen.dart';
import 'package:eschoolaire_app/screens/intro_screen.dart';
import 'package:eschoolaire_app/widgets/bottonnavigator_screen.dart';
import 'package:firebase_app_check/firebase_app_check.dart';


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'escool',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: kSecondaryColor,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(26),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
      home: const HomeAdminScreen(),
    );
  }
}
