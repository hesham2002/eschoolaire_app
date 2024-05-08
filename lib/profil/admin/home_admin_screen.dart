
import 'package:eschoolaire_app/constant.dart';
import 'package:eschoolaire_app/profil/admin/attendance_teachers_screen.dart';
import 'package:eschoolaire_app/profil/admin/exam_table_screen.dart';
import 'package:eschoolaire_app/profil/admin/maps_screen.dart';
import 'package:eschoolaire_app/profil/admin/students/list_students.dart';
import 'package:eschoolaire_app/profil/admin/teachers/list_teachers.dart';
import 'package:eschoolaire_app/profil/admin/time_table_screen.dart';
import 'package:flutter/material.dart';

class HomeAdminScreen extends StatefulWidget {
  const HomeAdminScreen({super.key});

  @override
  State<HomeAdminScreen> createState() => _HomeAdminScreenState();
}

class _HomeAdminScreenState extends State<HomeAdminScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
                  trailing: Text('Hello Admin!',
                      style: TextStyle(color: Colors.white, fontSize: 30)),
                ),
                SizedBox(height: 30)
              ],
            ),
          ),
          Container(
            color: kPrimaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                  color: kTextWhiteColor,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(200))),
              child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 30,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: kTextWhiteColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 5),
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(.2),
                                spreadRadius: 2,
                                blurRadius: 5)
                          ]),
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/icons/prof.png",
                                width: 100,
                                height: 100,
                              ),
                              const Text(
                                "teachers",
                                style: TextStyle(
                                    color: kTextBlackColor, fontSize: 20),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TeachersPage()),
                          );
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: kTextWhiteColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 5),
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(.2),
                                spreadRadius: 2,
                                blurRadius: 5)
                          ]),
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/icons/Students.png",
                                width: 100,
                                height: 100,
                              ),
                              const Text(
                                "Students",
                                style: TextStyle(
                                    color: kTextBlackColor, fontSize: 20),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ListStudents()),
                          );
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: kTextWhiteColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 5),
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(.2),
                                spreadRadius: 2,
                                blurRadius: 5)
                          ]),
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/icons/timetable.png",
                                width: 100,
                                height: 100,
                              ),
                              const Text(
                                "Time Table",
                                style: TextStyle(
                                    color: kTextBlackColor, fontSize: 20),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CalendarPage()),
                          );
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: kTextWhiteColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 5),
                                color: kTextBlackColor.withOpacity(.2),
                                spreadRadius: 2,
                                blurRadius: 5)
                          ]),
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/icons/attandance prf.png",
                                width: 100,
                                height: 100,
                              ),
                              const Text(
                                "Attendance",
                                style: TextStyle(
                                    color: kTextBlackColor, fontSize: 20),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AttendanceTeachersScreen()),
                          );
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: kTextWhiteColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 5),
                                color: kTextBlackColor.withOpacity(.2),
                                spreadRadius: 2,
                                blurRadius: 5)
                          ]),
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/icons/examtable.png",
                                width: 100,
                                height: 100,
                              ),
                              const Text(
                                "ExamTable",
                                style: TextStyle(
                                    color: kTextBlackColor, fontSize: 20),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AdminExamTable()),
                          );
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: kTextWhiteColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 5),
                                color: kTextBlackColor.withOpacity(.2),
                                spreadRadius: 2,
                                blurRadius: 5)
                          ]),
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/icons/bus.png",
                                width: 100,
                                height: 100,
                              ),
                              const Text(
                                "BusTraking",
                                style: TextStyle(
                                    color: kTextBlackColor, fontSize: 20),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MapWidget()),
                          );
                        },
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
