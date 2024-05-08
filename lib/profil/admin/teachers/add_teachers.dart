import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eschoolaire_app/constant.dart';

import 'package:flutter/material.dart';

class AddTeachers extends StatefulWidget {
  const AddTeachers({super.key});

  @override
  State<AddTeachers> createState() => _EditTeachersState();
}

class _EditTeachersState extends State<AddTeachers> {
  addtea(var duration, name, email, phone, subject, classs, pass) async {
    await FirebaseFirestore.instance.collection("teacher").add({
      "name": name,
      "email": email,
      "phone": phone,
      "subject": subject,
      "class": classs,
      "duration": duration,
      "pass": pass,
      "date": DateTime.now()
    }).then((value) {
      //add teacher
    });
  }

  var name, pass, email, duration, classs, subject, phone;
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
                  Icon(Icons.person_add),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Add Teachers",
                    style: TextStyle(fontSize: 15, color: kTextBlackColor),
                  )
                ],
              ),
              Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      onSaved: (vl) {
                        name = vl;
                      },
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
                      onSaved: (vl) {
                        email = vl;
                      },
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
                      onSaved: (vl) {
                        pass = vl;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter a valide pass';
                        }
                        if (value.length < 6) {
                          return ' the pass is shourt';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "pass",
                          prefixIcon: Icon(
                            Icons.lock,
                            color: kPrimaryColor,
                          )),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onSaved: (vl) {
                        phone = vl;
                      },
                      validator: (value) {
                        if (value!.length == 11) {
                          return 'you phone must be isEqualTo  11 number';
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Phone number",
                        prefixIcon: Icon(
                          Icons.phone,
                          color: kPrimaryColor,
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onSaved: (vl) {
                        subject = vl;
                      },
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'enter a valide Teaching Subject';
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Teaching Subject",
                        prefixIcon: Icon(
                          Icons.school,
                          color: kPrimaryColor,
                        ),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onSaved: (vl) {
                        classs = vl;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter a valide class';
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "Classe Teaching",
                          prefixIcon: Icon(
                            Icons.school,
                            color: kPrimaryColor,
                          )),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onSaved: (vl) {
                        duration = vl;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter a valide Teaching duration';
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "Teaching duration",
                          prefixIcon: Icon(
                            Icons.filter_1,
                            color: kPrimaryColor,
                          )),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purpleAccent[100],
                      ),
                      onPressed: () {
                        addtea(duration, name, email, phone, subject, classs,
                            pass);
                      },
                      child: const Text(
                        'SAVE',
                        style: TextStyle(color: Colors.black),
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purpleAccent[100],
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'CANNEL',
                        style: TextStyle(color: Colors.black),
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
