import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eschoolaire_app/constant.dart';
import 'package:eschoolaire_app/profil/admin/teachers/add_teachers.dart';
import 'package:eschoolaire_app/profil/admin/teachers/edit_teachers.dart';

import 'package:flutter/material.dart';

class Teacher {
  late final String name;
  late final String subject;
  late final String department;
  late final String phoneNumber;
  late final String email;
  late final String joinedDate;
  int teachingDuration;
  late final String cvUrl; // Add cvUrl field

  Teacher({
    required this.name,
    required this.subject,
    required this.department,
    required this.phoneNumber,
    required this.email,
    required this.joinedDate,
    this.teachingDuration = 0,
    required this.cvUrl,
  });
}

List<Teacher> teachers = [
  Teacher(
    name: 'John Doe',
    subject: 'Mathematics',
    department: 'Science',
    phoneNumber: '+1234567890',
    email: 'john.doe@example.com',
    joinedDate: 'January 1, 2010',
    teachingDuration: 3,
    cvUrl: 'https://example.com/john_doe_cv.pdf',
  ),

  // Add more teachers as needed
];

// ignore: must_be_immutable
class TeachersPage extends StatelessWidget {
  TeachersPage({super.key});
  List teacher = [];
  getyeach() async {
    await FirebaseFirestore.instance.collection("teacher").get().then((value) {
      for (var element in value.docs) {
        teacher.add(element.data());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 130,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple[200]!, Colors.purple[300]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
                const Text(
                  'Teacher List',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showSearch(
                        context: context, delegate: _TeacherSearchDelegate());
                  },
                  icon: const Icon(Icons.search, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: teachers.length,
              itemBuilder: (context, index) {
                return TeacherCard(teacher: teachers[index]);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purpleAccent[100],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTeachers(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TeacherCard extends StatelessWidget {
  final Teacher teacher;

  const TeacherCard({super.key, required this.teacher});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TeacherDetailPage(teacher: teacher),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    teacher.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                final teacherIndex = teachers.indexOf(teacher);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EditTeachers(teacherIndex: teacherIndex),
                  ),
                );
              },
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                _showDeleteConfirmationDialog(context, teacher);
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, Teacher teacher) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Teacher'),
          content: const Text('Are you sure you want to delete this teacher?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _deleteTeacher(context, teacher);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _deleteTeacher(BuildContext context, Teacher teacher) {
    teachers.remove(teacher);
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => TeachersPage(),
    ));
  }
}

class TeacherDetailPage extends StatelessWidget {
  final Teacher teacher;

  const TeacherDetailPage({super.key, required this.teacher});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Teacher Details'),
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
                    _buildInfoRow('Name', teacher.name),
                    _buildInfoRow('Subject', teacher.subject),
                    _buildInfoRow('Department', teacher.department),
                    _buildInfoRow('Phone', teacher.phoneNumber),
                    _buildInfoRow('Email', teacher.email),
                    _buildInfoRow('Joined', teacher.joinedDate),
                    const SizedBox(
                        height: 20), // Add space between info and button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TeacherCvPage(cvUrl: teacher.cvUrl),
                          ),
                        );
                      },
                      child: const Text('View CV'),
                    ),
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

class TeacherCvPage extends StatelessWidget {
  final String cvUrl;

  const TeacherCvPage({super.key, required this.cvUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Teacher CV'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Open the CV URL in a web browser or PDF viewer
          },
          child: const Text('View CV'),
        ),
      ),
    );
  }
}

class _TeacherSearchDelegate extends SearchDelegate<String> {
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
