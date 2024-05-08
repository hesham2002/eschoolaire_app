
import 'package:eschoolaire_app/constant.dart';
import 'package:flutter/material.dart';

class Student {
  final String name;
  final String level;
  final String registrationNumber;
  final String phoneNumber;
  final String parent;
  final String className;

  Student({
    required this.name,
    required this.level,
    required this.registrationNumber,
    required this.phoneNumber,
    required this.parent,
    required this.className,
  });
}

List<Student> studentsList = [
  Student(
    name: 'John Doe',
    level: 'Senior',
    registrationNumber: '12345',
    phoneNumber: '123456789',
    parent: 'Jane Doe',
    className: '12A',
  ),
  Student(
    name: 'Jane Smith',
    level: 'Junior',
    registrationNumber: '54321',
    phoneNumber: '987654321',
    parent: 'John Smith',
    className: '10B',
  ),
  // Add more sample data as needed
];

class Students extends StatefulWidget {
  const Students({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _StudentsState createState() => _StudentsState();
}

class _StudentsState extends State<Students> {
  String? selectedDepartment;

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
                  value: selectedDepartment,
                  hint: const Text(
                    'Select Classe',
                    style: TextStyle(color: Colors.white),
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      selectedDepartment = newValue;
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
              itemCount: studentsList.length,
              itemBuilder: (context, index) {
                if (selectedDepartment == null ||
                    selectedDepartment == studentsList[index].className) {
                  return GestureDetector(
                    /*   onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              StudentDetailPage(student: studentsList[index]),
                        ),
                      );
                    },*/
                    child: Card(
                      color: kSecondaryColor,
                      margin: const EdgeInsets.all(10),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(
                          studentsList[index].name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
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
