

import 'package:eschoolaire_app/constant.dart';
import 'package:eschoolaire_app/profil/admin/attendance_teachers_screen.dart';
import 'package:eschoolaire_app/profil/parents/schedule_p_screen.dart';
import 'package:eschoolaire_app/profil/teachers/observation_screen.dart';
import 'package:eschoolaire_app/profil/teachers/student_screen.dart';
import 'package:eschoolaire_app/profil/teachers/teachers_cv.dart';
import 'package:flutter/material.dart';


class HomeTeachersScreen extends StatefulWidget {
  const HomeTeachersScreen({super.key});

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
                  trailing: Text('Hello teacher!',
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
                                Image.asset("assets/icons/Students.png",width:100,height: 100,),
                                const Text("Students",style: TextStyle(color: kTextBlackColor,fontSize: 20),)
                              ],
                            ),
                          ),
                          onTap:() {
                            Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Students()  ),
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
                      child:  InkWell(
                        
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Image.asset("assets/icons/cv.png",width:100,height: 100,),
                                const Text("My CV",style: TextStyle(color: kTextBlackColor,fontSize: 20),)
                              ],
                            ),
                          ),
                          onTap:() {
                            Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>   const AjouterCVPage()),
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
                                Image.asset("assets/icons/timetable.png",width:100,height: 100,),
                                const Text("Tables",style: TextStyle(color: kTextBlackColor,fontSize: 20),)
                              ],
                            ),
                          ),
                            onTap:() {
                            Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>   const SchedulePage()),
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
                                Image.asset("assets/icons/attandance etd.png",width:100,height: 100,),
                                const Text("Attendance",style: TextStyle(color: kTextBlackColor,fontSize: 20),)
                              ],
                            ),
                          ),
                          onTap:() {
                            Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>   const AttendanceTeachersScreen()),
                      );
                          },
                        ),
                    ),
                    Center(
                      child: Container(
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
                                  Image.asset("assets/icons/exampoint.png",width:100,height: 100,),
                                  const Text("Obsarvation",style: TextStyle(color: kTextBlackColor,fontSize: 20),)
                                ],
                                  
                              ),
                            ),
                                        
                        onTap:() {
                            Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>   MainListPage()),
                      );
                          },

              

                          ),
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