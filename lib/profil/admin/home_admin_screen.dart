import 'package:flutter/material.dart';
import 'package:eschoolaire_app/constant.dart';
import 'package:eschoolaire_app/profil/admin/attendance_teachers_screen.dart';
import 'package:eschoolaire_app/profil/admin/exam_table_screen.dart';
import 'package:eschoolaire_app/profil/admin/maps_screen.dart';
import 'package:eschoolaire_app/profil/admin/students/list_students.dart';
import 'package:eschoolaire_app/profil/admin/teachers/list_teachers.dart';
import 'package:eschoolaire_app/profil/admin/time_table_screen.dart';

class HomeAdminScreen extends StatefulWidget {
  const HomeAdminScreen({Key? key});

  @override
  State<HomeAdminScreen> createState() => _HomeAdminScreenState();
}

class _HomeAdminScreenState extends State<HomeAdminScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // Determine the screen width
    final screenWidth = MediaQuery.of(context).size.width;

    // Set the number of cross axis counts based on screen width
    int crossAxisCount = 2;
    if (screenWidth > 600) {
      crossAxisCount = 4;
    }

    return Scaffold(
      key: scaffoldKey,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: const Column(
              children: [
                SizedBox(height: 50),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  trailing: Text(
                    'Hello Admin!',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
          Container(
            color: kPrimaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: kTextWhiteColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(200)),
              ),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 30),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return buildGridItem(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build grid item
  Widget buildGridItem(int index) {
    List<Map<String, dynamic>> gridItems = [
      {
        'imageAsset': "assets/icons/prof.png",
        'title': "Teachers",
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TeachersPage()),
          );
        },
      },
      {
        'imageAsset': "assets/icons/Students.png",
        'title': "Students",
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ListStudents()),
          );
        },
      },
      {
        'imageAsset': "assets/icons/timetable.png",
        'title': "Time Table",
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CalendarPage()),
          );
        },
      },
      {
        'imageAsset': "assets/icons/attandance prf.png",
        'title': "Attendance",
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const AttendanceTeachersScreen()),
          );
        },
      },
      {
        'imageAsset': "assets/icons/examtable.png",
        'title': "Exam Table",
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AdminExamTable()),
          );
        },
      },
      {
        'imageAsset': "assets/icons/bus.png",
        'title': "Bus Tracking",
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MapWidget()),
          );
        },
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: kTextWhiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Theme.of(context).primaryColor.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: InkWell(
        onTap: gridItems[index]['onTap'],
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset(
                gridItems[index]['imageAsset'],
                width: 100,
                height: 100,
              ),
              Text(
                gridItems[index]['title'],
                style: TextStyle(color: kTextBlackColor, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
