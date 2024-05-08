// ignore_for_file: non_constant_identifier_names


import 'package:eschoolaire_app/profil/admin/attendance_teachers_screen.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  
  // Lists of programs for each day
  Map<String, List<String>> programs = {
    "S": [
      "08:00-09:00 Phisique",
      "09:00-10:00 Mathématiques",
      "10:00-11:00 Français",
      "13:00-14:00 Français",
      "14:00-15:00 Français"
    ],
    "M": ["Monday's Program"],
    "T": ["Tuesday's Program"],
    "W": ["Wednesday's Program"],
    "Th": ["Thursday's Program"],
  };

  // Selected day state
  String selectedDay = "S";
String selectedLevel = "Level 1"; 

List<String> levels = [
  "Level 1",
  "Level 2",
  "Level 3",
  "Level 4",
  "Level 5",
 
];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent[100],
        title: Row(
          children: [
            const Text(
              'Time ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 30,
              ),
            ),
            const Text(
              'Table ',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddModulePage()),
                );
              },
              icon: const Icon(Icons.add),
              color: Colors.black,
              iconSize: 30,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
            alignment: Alignment.topCenter,
            color: Colors.grey[200],
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            top: 15,
            child: Container(
              height: MediaQuery.of(context).size.height - 160,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 70),
                    child: ClassSelectionDropdown(),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15, bottom: 30),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildDateColumn("S"),
                        buildDateColumn("M"),
                        buildDateColumn("T"),
                        buildDateColumn("W"),
                        buildDateColumn("Th"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for (String program in programs[selectedDay]!)
                            buildTaskListItem(program),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildTaskListItem(String program) {
    
    String time = program.split(' ')[0];
    String subject = program.split(' ')[1];
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.purpleAccent,
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(5),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 160,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: time,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: const [
                          TextSpan(
                            text: " AM",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            subject,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Container buildDateColumn(String weekDay) {
    return Container(
      decoration: selectedDay == weekDay
          ? BoxDecoration(
              color: Colors.purpleAccent[100],
              borderRadius: BorderRadius.circular(10),
            )
          : null,
      height: 55,
      width: 35,
      child: InkWell(
        onTap: () {
          setState(() {
            selectedDay = weekDay;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              weekDay,
              style: const TextStyle(color: Colors.black, fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}

class AddModulePage extends StatefulWidget {
  const AddModulePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddModulePageState createState() => _AddModulePageState();
}

class _AddModulePageState extends State<AddModulePage> {
  // List of available subjects
  List<String> subjects = [
    "Mathematics",
    "Arabic Language",
    "French Language",
    "Science",
    "History",
    "Geography",
    "Islamic Education",
    "Physical Education",
    "Music",

    // Add more subjects here if needed
  ];

  // List of available school levels
  List<String> schoolLevels = [
    "Level 1",
    "Level 2",
    "Level 3",
    "Level 4",
    "Level 5",
    // Add more levels here if needed
  ];

  // Selected subject and school level

  List<String> TheDay = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    // Add more levels here if needed
  ];
  List<String> StartTime = [
    "08:00",
    "09:00",
    "10:15",
    "13:00",
    "14:00",
    // Add more levels here if needed
  ];
  List<String> EndTime = [
    "09:00",
    "10:00",
    "11:15",
    "14:00",
    "15:30",
    // Add more levels here if needed
  ];
  String selectedSubject = "Mathematics";
  String selectedSchoolLevel = "Level 1";
  String selectedTheDay = "Sunday";
  String selectedStartTime = "08:00";
  String selectedEndTime = "09:00";@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent[100],
        title: const Row(
          children: [
            Text(
              'Add ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 30,
              ),
            ),
            Text(
              'Module ',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Row(
            children: [
              Icon(Icons.circle,
                  color: Colors.purpleAccent, size: 10), // هنا النقطة البنفسجية
              SizedBox(width: 5), // بعض المسافة بين النقطة والعنوان
              Text(
                'Subject',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          DropdownButton<String>(
            value: selectedSubject,
            onChanged: (String? newValue) {
              setState(() {
                selectedSubject = newValue!;
              });
            },
            items: subjects.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Icon(Icons.circle,
                  color: Colors.purpleAccent, size: 10), // هنا النقطة البنفسجية
              SizedBox(width: 5), // بعض المسافة بين النقطة والعنوان
              Text(
                'School Level',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          DropdownButton<String>(
            value: selectedSchoolLevel,
            onChanged: (String? newValue) {
              setState(() {
                selectedSchoolLevel = newValue!;
              });
            },
            items: schoolLevels.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Icon(Icons.circle,
                  color: Colors.purpleAccent, size: 10), // هنا النقطة البنفسجية
              SizedBox(width: 5), // بعض المسافة بين النقطة والعنوان
              Text(
                'The Day',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          DropdownButton<String>(
            value: selectedTheDay,
            onChanged: (String? newValue) {
              setState(() {
                selectedTheDay = newValue!;
              });
            },
            items: TheDay.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Icon(Icons.circle,
                  color: Colors.purpleAccent, size: 10), // هنا النقطة البنفسجية
              SizedBox(width: 5), // بعض المسافة بين النقطة والعنوان
              Text(
                'Start Time ',
                style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          DropdownButton<String>(
            value: selectedStartTime,
            onChanged: (String? newValue) {
              setState(() {
                selectedStartTime = newValue!;
              });
            },
            items: StartTime.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Icon(Icons.circle,
                  color: Colors.purpleAccent, size: 10), // هنا النقطة البنفسجية
              SizedBox(width: 5), // بعض المسافة بين النقطة والعنوان
              Text(
                'End Time ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          DropdownButton<String>(
            value: selectedEndTime,
            onChanged: (String? newValue) {
              setState(() {
                selectedEndTime = newValue!;
              });
            },
            items: EndTime.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              // Add functionality for 'end' button here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purpleAccent[100],
              minimumSize: const Size.fromHeight(50),
            ),
            child: const Text(
              'Add',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              // Add functionality for 'end' button here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purpleAccent[100],
              minimumSize: const Size.fromHeight(50),
            ),
            child: const Text(
              'End',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ]),
      ),
    );
  }
}