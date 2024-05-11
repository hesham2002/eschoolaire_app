import 'package:flutter/material.dart';
import 'package:eschoolaire_app/constant.dart';
import 'package:eschoolaire_app/profil/admin/attendance_teachers_screen.dart';
import 'package:eschoolaire_app/profil/teachers/observation_screen.dart';
import 'package:eschoolaire_app/profil/teachers/student_screen.dart';
import 'package:eschoolaire_app/profil/teachers/teachers_cv.dart';

import '../parents/schedule_p_screen.dart';

class HomeTeachersScreen extends StatefulWidget {
  const HomeTeachersScreen({Key? key});

  @override
  State<HomeTeachersScreen> createState() => _HomeTeachersScreenState();
}

class _HomeTeachersScreenState extends State<HomeTeachersScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 50),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  trailing: Text(
                    'Hello teacher!',
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
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: kTextWhiteColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(200)),
              ),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 30,crossAxisSpacing: 10),
                itemCount: 5,
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
        'imageAsset': "assets/icons/Students.png",
        'title': "Students",
        'page': const Students(),
      },
      {
        'imageAsset': "assets/icons/cv.png",
        'title': "My CV",
        'page': const AjouterCVPage(),
      },
      {
        'imageAsset': "assets/icons/timetable.png",
        'title': "Tables",
        'page': const SchedulePage(),
      },
      {
        'imageAsset': "assets/icons/attandance etd.png",
        'title': "Attendance",
        'page': const AttendanceTeachersScreen(),
      },
      {
        'imageAsset': "assets/icons/exampoint.png",
        'title': "Obsarvation",
        'page': const MainListPage(),
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: kTextWhiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: kTextBlackColor.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => gridItems[index]['page']),
          );
        },
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
