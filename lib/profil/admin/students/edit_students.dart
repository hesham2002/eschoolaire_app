import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eschoolaire_app/constant.dart';

import 'package:flutter/material.dart';

class EditStudent extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final name, level, className, phone, registrationNumber, parent;

  const EditStudent(
      {super.key,
      required this.className,
      required this.level,
      required this.name,
      required this.parent,
      required this.phone,
      required this.registrationNumber});

  @override
  // ignore: library_private_types_in_public_api
  _EditStudentState createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  final _formKey = GlobalKey<FormState>();
  editst(
      var name, level, registernumber, phonenumper, classname, parent) async {
    await FirebaseFirestore.instance
        .collection("student")
        .where("name", isEqualTo: widget.name)
        .get()
        .then((value) {
      for (var element in value.docs) {
        element.reference.update({
          "name": name,
          "registernumber": registernumber,
          "level": level,
          "parent": parent,
          "phonenumper": phonenumper,
          "classname": classname
        });
      }
    });
  }

  late String _name;
  late String _level;
  late String _registrationNumber;
  late String _phoneNumber;
  late String _parent;
  late String _className;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Edit Student'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  initialValue: widget.name,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                  onSaved: (value) => _name = value!,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: widget.level,
                  decoration: const InputDecoration(labelText: 'Level'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a level';
                    }
                    return null;
                  },
                  onSaved: (value) => _level = value!,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: widget.registrationNumber,
                  decoration:
                      const InputDecoration(labelText: 'Registration Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a registration number';
                    }
                    return null;
                  },
                  onSaved: (value) => _registrationNumber = value!,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: widget.phone,
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone number';
                    }
                    return null;
                  },
                  onSaved: (value) => _phoneNumber = value!,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: widget.parent,
                  decoration: const InputDecoration(labelText: 'Parent'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a parent name';
                    }
                    return null;
                  },
                  onSaved: (value) => _parent = value!,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: widget.className,
                  decoration: const InputDecoration(labelText: 'Class Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a class name';
                    }
                    return null;
                  },
                  onSaved: (value) => _className = value!,
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        editst(_name, _level, _registrationNumber, _phoneNumber,
                            _className, _parent);

                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
