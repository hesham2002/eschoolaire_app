import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eschoolaire_app/constant.dart';
import 'package:eschoolaire_app/profil/admin/students/edit_students.dart';
import 'package:eschoolaire_app/profil/teachers/student_screen.dart';

import 'package:flutter/material.dart';

class ListStudents extends StatefulWidget {
  const ListStudents({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ListStudentsState createState() => _ListStudentsState();
}

class _ListStudentsState extends State<ListStudents> {
  String? _selectedDepartment;
  List students = [];
  getstudent() async {
    await FirebaseFirestore.instance.collection("student").get().then((value) {
      for (var element in value.docs) {
        students.add(element.data());
        print("++++++++++++++++++++++++++");
        print(students);
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getstudent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple[200]!, Colors.purple[300]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.only(
              left: 20,
              top: 40,
              right: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const Text(
                      'Student List',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showSearch(
                            context: context,
                            delegate: _StudentSearchDelegate());
                      },
                      icon: const Icon(Icons.search, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                DropdownButton<String>(
                  value: _selectedDepartment,
                  hint: const Text(
                    'Select Classe',
                    style: TextStyle(color: Colors.white),
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedDepartment = newValue;
                    });
                  },
                  items: <String>[
                    'Classe A',
                    'Classe B',
                    // Add more departments as needed
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,
                          style: const TextStyle(color: Colors.black)),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                if (_selectedDepartment == null ||
                    _selectedDepartment == studentsList[index].className) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentDetailPage(
                            className: students[index]["classname"],
                            level: students[index]["level"],
                            name: students[index]["name"],
                            parent: students[index]["parent"],
                            phone: students[index]["phonenumper"],
                            registrationNumber: students[index]
                                ["registernumber"],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      color: kSecondaryColor,
                      margin: const EdgeInsets.all(10),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(
                          students[index]["name"],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditStudent(
                                      className: students[index]["classname"],
                                      level: students[index]["level"],
                                      name: students[index]["name"],
                                      parent: students[index]["parent"],
                                      phone: students[index]["phonenumper"],
                                      registrationNumber: students[index]
                                          ["registernumber"],
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                _showDeleteConfirmationDialog(
                                    context, students[index]["name"]);
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return const SizedBox(); // Return an empty SizedBox if the student does not belong to the selected department
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddChildPage()),
          );
        },
        tooltip: 'Add Child',
        backgroundColor: Colors.purpleAccent[100],
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, String student) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Student'),
          content: const Text('Are you sure you want to delete this student?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection("student")
                    .where("name", isEqualTo: student)
                    .get()
                    .then((value) {
                  value.docs.forEach((element) async {
                    var s = element.id;
                    await FirebaseFirestore.instance
                        .collection("student")
                        .doc("$s")
                        .delete();
                    students.clear();
                    getstudent();
                    Navigator.pop(context);
                    setState(() {});
                  });
                });
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _deleteStudent(BuildContext context, Student student) {
    studentsList.remove(student);
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const ListStudents(),
    ));
  }
}

class StudentDetailPage extends StatelessWidget {
  final name, level, className, phone, registrationNumber, parent;

  StudentDetailPage(
      {super.key,
      required this.className,
      required this.level,
      required this.name,
      required this.parent,
      required this.phone,
      required this.registrationNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Student Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow('Name', name),
                    _buildInfoRow('Level', level),
                    _buildInfoRow('Registration Number', registrationNumber),
                    _buildInfoRow('Phone Number', phone),
                    _buildInfoRow('Parent', parent),
                    _buildInfoRow('Class', className),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 4),
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.purple, // اللون البنفسجي
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddChildPage extends StatefulWidget {
  const AddChildPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddChildPageState createState() => _AddChildPageState();
}

class _AddChildPageState extends State<AddChildPage> {
  TextEditingController name = TextEditingController();
  TextEditingController registernumber = TextEditingController();
  TextEditingController level = TextEditingController();
  TextEditingController parent = TextEditingController();
  TextEditingController phonenumper = TextEditingController();
  TextEditingController classname = TextEditingController();
  bool s = false;
  addstudent() async {
    var ch;
    setState(() {
      s = true;
    });
    await FirebaseFirestore.instance.collection("student").add({
      "name": name.text,
      "registernumber": registernumber.text,
      "level": level.text,
      "parent": parent.text,
      "phonenumper": phonenumper.text,
      "classname": classname.text
    }).then((value) {
      ch = "done";
    });
    if (ch == "done") {
      print("done");
    }
    phonenumper.clear();
    level.clear();
    parent.clear();
    registernumber.clear();
    name.clear();
    classname.clear();
    setState(() {
      s = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Add Student'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              TextField(
                controller: name,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: registernumber,
                decoration: const InputDecoration(
                  labelText: 'Register Number',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: level,
                decoration: const InputDecoration(
                  labelText: 'Level',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: parent,
                decoration: const InputDecoration(
                  labelText: 'Parent',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: phonenumper,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: classname,
                decoration: const InputDecoration(
                  labelText: 'Class Name',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    // Add logic to send child information to admin
                    // Go back to ListStudents page
                    if (name.text == "" ||
                        classname.text == "" ||
                        level.text == "" ||
                        parent.text == "" ||
                        phonenumper.text == "" ||
                        registernumber.text == "") {
                      print("enter data");
                    } else {
                      addstudent();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purpleAccent[100],
                  ),
                  child: const Text(
                    'Send',
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class _StudentSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement search results here
    return const Text('Search Results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement suggestions here
    return const Text('Search Suggestions');
  }
}
