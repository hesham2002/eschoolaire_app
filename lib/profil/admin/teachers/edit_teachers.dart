import 'package:eschoolaire_app/constant.dart';
import 'package:eschoolaire_app/profil/admin/teachers/list_teachers.dart';
import 'package:flutter/material.dart';


class EditTeachers extends StatefulWidget {
  final int teacherIndex;

  const EditTeachers({super.key, required this.teacherIndex});

  @override
  // ignore: library_private_types_in_public_api
  _EditTeachersState createState() => _EditTeachersState();
}

class _EditTeachersState extends State<EditTeachers> {
  final _formKey = GlobalKey<FormState>();

  late String _name;
  late String _subject;
  late String _department;
  late String _phoneNumber;
  late String _email;
  late String _joinedDate;
  int _teachingDuration = 0;
  late String _cvUrl;

  @override
  void initState() {
    super.initState();
    final teacher = teachers[widget.teacherIndex];
    _name = teacher.name;
    _subject = teacher.subject;
    _department = teacher.department;
    _phoneNumber = teacher.phoneNumber;
    _email = teacher.email;
    _joinedDate = teacher.joinedDate;
    _teachingDuration = teacher.teachingDuration;
    _cvUrl = teacher.cvUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Edit Teacher'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              const SizedBox(height: 16), // إضافة فراغ بين الحقول
              TextFormField(
                initialValue: _subject,
                decoration: const InputDecoration(labelText: 'Subject'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a subject';
                  }
                  return null;
                },
                onSaved: (value) => _subject = value!,
              ),
              const SizedBox(height: 16), // إضافة فراغ بين الحقول
              TextFormField(
                initialValue: _department,
                decoration: const InputDecoration(labelText: 'Department'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a department';
                  }
                  return null;
                },
                onSaved: (value) => _department = value!,
              ),
              const SizedBox(height: 16), // إضافة فراغ بين الحقول
              TextFormField(
                initialValue: _phoneNumber,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
                onSaved: (value) => _phoneNumber = value!,
              ),
              const SizedBox(height: 16), // إضافة فراغ بين الحقول
              TextFormField(
                initialValue: _email,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
              const SizedBox(height: 16), // إضافة فراغ بين الحقول
              TextFormField(
                initialValue: _joinedDate,
                decoration: const InputDecoration(labelText: 'Joined Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a joined date';
                  }
                  return null;
                },
                onSaved: (value) => _joinedDate = value!,
              ),
              const SizedBox(height: 16), // إضافة فراغ بين الحقول
              TextFormField(
                initialValue: _cvUrl,
                decoration: const InputDecoration(labelText: 'CV URL'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a CV URL';
                  }
                  return null;
                },
                onSaved: (value) => _cvUrl = value!,
              ),
              const SizedBox(height: 16), // إضافة فراغ بين الحقول
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final teacher = teachers[widget.teacherIndex];
                      setState(() {
                        teacher.name = _name;
                        teacher.subject = _subject;
                        teacher.department = _department;
                        teacher.phoneNumber = _phoneNumber;
                        teacher.email = _email;
                        teacher.teachingDuration = _teachingDuration;
                        teacher.cvUrl = _cvUrl;
                      });
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
    );
  }
}
