import 'package:flutter/material.dart';

class Student {
  final String name;
  final List<String> subjects;

  Student({required this.name, required this.subjects});
}

class MainListPage extends StatefulWidget {
  const MainListPage({Key? key}) : super(key: key);

  @override
  _MainListPageState createState() => _MainListPageState();
}

class _MainListPageState extends State<MainListPage> {
  String? selectedDepartment;

  final List<Student> students = [
    Student(name: 'John Doe', subjects: ['Math', 'Science', 'English']),
    Student(name: 'Jane Smith', subjects: ['History', 'Geography', 'Physics']),
    // Add more students as needed
  ];

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
              itemCount: students.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExamGradesPage(student: students[index]),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        title: Text(
                          students[index].name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ExamGradesPage extends StatefulWidget {
  final Student student;

  const ExamGradesPage({Key? key, required this.student}) : super(key: key);

  @override
  _ExamGradesPageState createState() => _ExamGradesPageState();
}

class _ExamGradesPageState extends State<ExamGradesPage> {
  final List<String> _semesters = ['Semester 1', 'Semester 2', 'Semester 3'];
  int _selectedSemesterIndex = 0;
  final List<double> _grades = [];
  late TextEditingController _remarksController;

  @override
  void initState() {
    super.initState();
    _remarksController = TextEditingController();
  }

  @override
  void dispose() {
    _remarksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exam Grades for ${widget.student.name}'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _semesters
                .map(
                  (semester) => InkWell(
                onTap: () {
                  setState(() {
                    _selectedSemesterIndex = _semesters.indexOf(semester);
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                    color: _selectedSemesterIndex == _semesters.indexOf(semester)
                        ? Colors.purpleAccent[100]
                        : Colors.transparent,
                  ),
                  child: Text(
                    semester,
                    style: TextStyle(
                      color: _selectedSemesterIndex == _semesters.indexOf(semester)
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
                .toList(),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: widget.student.subjects.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(widget.student.subjects[index]),
                    subtitle: Text('Grade: ${_grades.length > index ? _grades[index].toString() : 'N/A'}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        _showGradeDialog(context, index);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _remarksController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'General Remarks',
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () {
              // Implement sending grades to parent widget or any other action here
            },
            backgroundColor: Colors.purpleAccent[100],
            child: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }

  void _showGradeDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Enter Grade for ${widget.student.subjects[index]}'),
        content: TextField(
          keyboardType: TextInputType.number,
          onChanged: (value) {
            setState(() {
              _grades.length > index ? _grades[index] = double.parse(value) : _grades.add(double.parse(value));
            });
          },
          decoration: const InputDecoration(
            hintText: 'Enter grade',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Save'),
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
