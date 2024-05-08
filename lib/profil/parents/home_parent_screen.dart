




import 'package:eschoolaire_app/constant.dart';
import 'package:eschoolaire_app/profil/admin/maps_screen.dart';
import 'package:eschoolaire_app/profil/admin/teachers/list_teachers.dart';
import 'package:eschoolaire_app/profil/parents/grades_child_screen.dart';
import 'package:eschoolaire_app/profil/parents/mychildren_screen.dart';
import 'package:eschoolaire_app/profil/parents/notification_screen.dart';
import 'package:eschoolaire_app/profil/parents/schedule_p_screen.dart';
import 'package:flutter/material.dart';


class HomeParentScreen extends StatefulWidget {
  const HomeParentScreen({super.key});

  @override
  State<HomeParentScreen> createState() => __HomeParentScreenState();
}

class __HomeParentScreenState extends State<HomeParentScreen> {
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
                  trailing: Text('Hello Parent!',
                      style: TextStyle(color: Colors.white, fontSize: 30)),
                ), 
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
                                Image.asset("assets/icons/prof.png",width:100,height: 100,),
                                const Text("teachers",style: TextStyle(color: kTextBlackColor,fontSize: 20),)
                              ],
                            ),
                          ),
                            onTap:() {
                            Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>    TeachersPage()),
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
                                Image.asset("assets/icons/My Children.png",width:100,height: 100,),
                                const Text("My Children",style: TextStyle(color: kTextBlackColor,fontSize: 20),)
                              ],
                            ),
                          ),
                           onTap:() {
                            Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>     MyChildrenPage()),
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
                                const Text(" Tables",style: TextStyle(color: kTextBlackColor,fontSize: 20),)
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
                                Image.asset("assets/icons/exampoint.png",width:100,height: 100,),
                                const Text("Exam Grades",style: TextStyle(color: kTextBlackColor,fontSize: 20),)
                              ],
                            ),
                          ),
                           onTap:() {
                            Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>    HomePage()),
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
                                Image.asset("assets/icons/notification.png",width:100,height: 100,),
                                const Text("Notification",style: TextStyle(color: kTextBlackColor,fontSize: 20),)
                              ],
                            ),
                          ),
                           onTap:() {
                            Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>   const NotificationPage()),
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
                                Image.asset("assets/icons/bus.png",width:100,height: 100,),
                                const Text("BusTraking",style: TextStyle(color: kTextBlackColor,fontSize: 20),)
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