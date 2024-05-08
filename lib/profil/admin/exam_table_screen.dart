import 'package:flutter/material.dart';


// Define a class for the exam
class Exam {
  String subject;
  String time;
  String date;

  Exam({required this.subject, required this.time, required this.date});
}

// Sample list of exams
List<Exam> exams = [
  Exam(subject: 'Mathematics', time: '10:00 AM', date: '2024-04-20'),
  Exam(subject: 'Physics', time: '02:00 PM', date: '2024-05-10'),
  // Add more exams as needed
];

// Widget for the exam table row
Widget examRow(BuildContext context, Exam exam) {
  return Card(
    child: ListTile(
      title: Text(
        exam.subject,
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        '${exam.time} - ${exam.date}',
        style: const TextStyle(color: Colors.grey),
      ),
      onTap: () {
        // Open the edit exam form
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditExamForm(exam)),
        );
      },
      trailing: IconButton( // Add edit icon button
        icon: const Icon(Icons.edit, color: Colors.grey),
        onPressed: () {
          // Open the edit exam form
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditExamForm(exam)),
          );
        },
      ),
    ),
  );
}

// Widget for the add exam form
class AddExamForm extends StatefulWidget {
  const AddExamForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddExamFormState createState() => _AddExamFormState();
}

class _AddExamFormState extends State<AddExamForm> {
  late String subject = '';
  late String time = '';
  late String date = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Exam'),
        backgroundColor: Colors.purpleAccent[100], // Change AppBar color to purple
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                subject = value;
              },
              decoration: const InputDecoration(
                labelText: 'Subject',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purpleAccent),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purpleAccent),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              onChanged: (value) {
                time = value;
              },
              decoration: const InputDecoration(
                labelText: 'Time (HH:MM AM/PM)',
                
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purpleAccent),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purpleAccent),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              onChanged: (value) {
                date = value;
              },
              decoration: const InputDecoration(
                labelText: 'Date (YYYY-MM-DD)',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purpleAccent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purpleAccent),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purpleAccent[100],
                textStyle: const TextStyle(color: Colors.black),
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              ),
              onPressed: () {
                // Validate the input fields
                if (subject.trim().isEmpty || time.trim().isEmpty || date.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill all fields')),
                  );
                } else {
                  setState(() {
                    exams.add(Exam(subject: subject, time: time, date: date));
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Add Exam', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget for the edit exam form
class EditExamForm extends StatefulWidget {
  final Exam exam;

  const EditExamForm(this.exam, {super.key, }) ;

  @override
  // ignore: library_private_types_in_public_api
  _EditExamFormState createState() => _EditExamFormState();
}

class _EditExamFormState extends State<EditExamForm> {
  late String newSubject = '';
  late String newTime = '';
  late String newDate = '';

  @override
  void initState() {
    super.initState();
    newSubject = widget.exam.subject;
    newTime = widget.exam.time;
    newDate = widget.exam.date;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Exam'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                newSubject = value;
              },
              decoration: const InputDecoration(
                labelText: 'Subject',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purpleAccent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purpleAccent),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              controller: TextEditingController(text: widget.exam.subject),
            ),
            const SizedBox(height: 12.0),
            TextField(
              onChanged: (value) {
                newTime = value;
              },
              decoration: const InputDecoration(
                labelText: 'Time (HH:MM AM/PM)',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purpleAccent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purpleAccent),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              controller: TextEditingController(text: widget.exam.time),
            ),
            const SizedBox(height: 12.0),
            TextField(
              onChanged: (value) {
                newDate = value;
              },
              decoration: const InputDecoration(
                labelText: 'Date (YYYY-MM-DD)',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purpleAccent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purpleAccent),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              controller: TextEditingController(text: widget.exam.date),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purpleAccent,
                textStyle: const TextStyle(color: Colors.black),
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              ),
              onPressed: () {
                // Validate the input fields
                if (newSubject.trim().isEmpty || newTime.trim().isEmpty || newDate.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill all fields')),
                  );
                } else {
                  setState(() {
                    widget.exam.subject = newSubject;
                    widget.exam.time = newTime;
                    widget.exam.date = newDate;
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Save Changes', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}

class AdminExamTable extends StatelessWidget {
  const AdminExamTable({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam Table'),
        backgroundColor: Colors.purpleAccent, // Change AppBar color to purple
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back), // Add back arrow
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Code to open the add exam form
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddExamForm()),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          return examRow(context, exams[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purpleAccent[100],
        onPressed: () {
          // Code to send the program to both parents and teachers
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Program has been sent to parents and teachers')),
          );
        },
        child: const Icon(Icons.send),
      ),
    );
  }
}
