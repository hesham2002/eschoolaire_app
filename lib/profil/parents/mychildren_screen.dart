
import 'package:eschoolaire_app/constant.dart';
import 'package:flutter/material.dart';

class Child {
  final String name;
  final String level;
  final String section;
  final String joinYear;
  final String registerNumber;

  Child({
    required this.name,
    required this.level,
    required this.section,
    required this.joinYear,
    required this.registerNumber,
  });
}

class MyChildrenPage extends StatelessWidget {
  final List<Child> children = [
    Child(
      name: 'John Doe',
      level: 'Grade 10',
      section: 'A',
      joinYear: '2018',
      registerNumber: "35010845",
    ),
    Child(
      name: 'Jane Smith',
      level: 'Grade 11',
      section: 'B',
      joinYear: '2019',
      registerNumber: "35010844",
    ),
  ];

  MyChildrenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('My Children'),
      ),
      body: ListView.builder(
        itemCount: children.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(
                'Name: ${children[index].name}',
                style: const TextStyle(color: Colors.black),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Level: ${children[index].level}',
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text(
                    'Section: ${children[index].section}',
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text(
                    'Join Year: ${children[index].joinYear}',
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text(
                    'Register Number: ${children[index].registerNumber}',
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
