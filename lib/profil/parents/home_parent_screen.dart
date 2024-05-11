import 'package:flutter/material.dart';
import 'package:eschoolaire_app/constant.dart';
import 'package:eschoolaire_app/profil/admin/maps_screen.dart';
import 'package:eschoolaire_app/profil/parents/grades_child_screen.dart';
import 'package:eschoolaire_app/profil/parents/mychildren_screen.dart';
import 'package:eschoolaire_app/profil/parents/notification_screen.dart';
import 'package:eschoolaire_app/profil/parents/schedule_p_screen.dart';
import 'package:eschoolaire_app/profil/parents/teachers_p_screen.dart';

class HomeParentScreen extends StatefulWidget {
  const HomeParentScreen({Key? key});

  @override
  State<HomeParentScreen> createState() => _HomeParentScreenState();
}

class _HomeParentScreenState extends State<HomeParentScreen> {
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
                    'Hello Parent!',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 10),
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
        'page': TeacherPage(),
      },
      {
        'imageAsset': "assets/icons/My Children.png",
        'title': "My Children",
        'page': MyChildrenPage(),
      },
      {
        'imageAsset': "assets/icons/timetable.png",
        'title': "Tables",
        'page': const SchedulePage(),
      },
      {
        'imageAsset': "assets/icons/exampoint.png",
        'title': "Exam Grades",
        'page': HomePage(),
      },
      {
        'imageAsset': "assets/icons/notification.png",
        'title': "Notification",
        'page': const NotificationPage(),
      },
      {
        'imageAsset': "assets/icons/bus.png",
        'title': "Bus Tracking",
        'page': const MapWidget(),
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
