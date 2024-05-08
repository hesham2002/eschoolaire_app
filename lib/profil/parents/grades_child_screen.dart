
import 'package:eschoolaire_app/constant.dart';
import 'package:flutter/material.dart';

class StudentGrade {
  final String name;
  final String section;
  final String level;
  final Map<String, double> grades;
  final String teacherNote;

  StudentGrade({
    required this.name,
    required this.section,
    required this.level,
    required this.grades,
    required this.teacherNote,
  });
}

class HomePage extends StatelessWidget {
  final List<StudentGrade> studentGrades = [
    StudentGrade(
      name: 'John Doe',
      section: 'A',
      level: 'Grade 10',
      grades: {'Math': 85, 'Science': 78, 'English': 90},
      teacherNote: 'Hardworking student, shows improvement in Math.',
    ),
    StudentGrade(
      name: 'Jane Smith',
      section: 'B',
      level: 'Grade 11',
      grades: {'Math': 92, 'Science': 88, 'English': 94},
      teacherNote: 'Excellent performance in all subjects.',
    ),
    // Add more student grades as needed
  ];

  HomePage({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Home'),
      ),
      body: ListView.builder(
        itemCount: studentGrades.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    studentGrades[index].name,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GradesPage(studentGrade: studentGrades[index]),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class GradesPage extends StatelessWidget {
  final StudentGrade studentGrade;

  const GradesPage({super.key,  required this.studentGrade});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Child Grades - ${studentGrade.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Child Name: ${studentGrade.name}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Section: ${studentGrade.section}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Level: ${studentGrade.level}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Subject',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Grade',
                        style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
                ...studentGrade.grades.entries.map((entry) {
                  return TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(entry.key),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(entry.value.toString()),
                      ),
                    ],
                  );
                }),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Teacher Note:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              studentGrade.teacherNote,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}