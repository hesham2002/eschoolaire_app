
import 'package:eschoolaire_app/constant.dart';
import 'package:flutter/material.dart';

class Teacher {
  final String name;
  final String subject;
  final String department;
  final String phoneNumber;
  final String email;
  final String joinedDate;
  final String cvUrl; // Add cvUrl field

  Teacher({
    required this.name,
    required this.subject,
    required this.department,
    required this.phoneNumber,
    required this.email,
    required this.joinedDate,
    required this.cvUrl, required bool active,
  });

  get active => null;
}

class TeachersPage extends StatelessWidget {
  final List<Teacher> teachers = [
    Teacher(
      name: 'John Doe',
      subject: 'Mathematics',
      department: 'Science',
      phoneNumber: '+1234567890',
      email: 'john.doe@example.com',
      joinedDate: 'January 1, 2010',
      cvUrl: 'https://example.com/john_doe_cv.pdf', active: true,  // Example CV URL
    ),
    Teacher(
      name: 'Jane Smith',
      subject: 'English',
      department: 'Language Arts',
      phoneNumber: '+0987654321',
      email: 'jane.smith@example.com',
      joinedDate: 'February 15, 2015',
      cvUrl: 'https://example.com/jane_smith_cv.pdf',  active: true, // Example CV URL
    ),
    // Add more teachers as needed
  ];

   TeachersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Teachers'),
      ),
      body: ListView.builder(
        itemCount: teachers.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TeacherCard(teacher: teachers[index]),
          );
        },
      ),
    );
  }
}

class TeacherCard extends StatelessWidget {
  final Teacher teacher;

   const TeacherCard({super.key,  required this.teacher}) ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TeacherDetailPage(teacher: teacher)),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              teacher.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Subject: ${teacher.subject}',
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              'Department: ${teacher.department}',
              style: const TextStyle(color: Colors.black),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TeacherCvPage(cvUrl: teacher.cvUrl)),
                );
              },
              child: const Text('View CV'),
            ),
          ],
        ),
      ),
    );
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
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
            // Open the CV URL in a browser
          },
          child: const Text('View CV'),
        ),
      ),
    );
  }
}
