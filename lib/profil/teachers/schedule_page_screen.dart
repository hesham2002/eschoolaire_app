
import 'package:eschoolaire_app/constant.dart';
import 'package:eschoolaire_app/profil/admin/attendance_teachers_screen.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  bool _showExamSchedule = false;
  final bool _examScheduleAdded = false;

  List<String> examSchedule = [
    "Monday - Math",
    "Tuesday - Science",
    "Wednesday - History",
    "Thursday - Literature",
    "Friday - Geography",
  ];

  Map<String, List<String>> weeklySchedule = {
    "S": ["08:00-09:00 Phisique", "09:00-10:00 Mathématiques", "10:00-11:00 Français", "13:00-14:00 Français", "14:00-15:00 Français"],
    "M": ["Monday's Program"],
    "T": ["Tuesday's Program"],
    "W": ["Wednesday's Program"],
    "Th": ["Thursday's Program"],
  };

  String selectedDay = "S";

  @override
  Widget build(BuildContext context) {
    List<String> schedule = _showExamSchedule ? examSchedule : weeklySchedule[selectedDay]!;
    String pageTitle = _showExamSchedule ? 'Exam Table' : 'Time Table';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(pageTitle, style: const TextStyle(fontWeight: FontWeight.normal)),
        actions: [
          IconButton(
            icon: Icon(_showExamSchedule ? Icons.assignment : Icons.calendar_today, color: _examScheduleAdded ? Colors.red : null),
            onPressed: () {
              setState(() {
                _showExamSchedule = !_showExamSchedule;
              });
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15, bottom: 30),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const ClassSelectionDropdown(),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildDateColumn("S"),
                    buildDateColumn("M"),
                    buildDateColumn("T"),
                    buildDateColumn("W"),
                    buildDateColumn("Th"),
                  ],
                ),
              ],
            )
          ),
          Column(
            children: [
              for (String program in schedule)
                buildTaskListItem(program),
            ],
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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
              const SizedBox(width: 15),
              SizedBox(
                width: MediaQuery.of(context).size.width - 160,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: time,
                        style: const TextStyle(fontWeight: FontWeight.bold,
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
          const SizedBox(height: 10),
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